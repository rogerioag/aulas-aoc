#include <iostream>
#include <fstream>
#include <cassert>

// CUDA driver & runtime
#include <cuda.h>
#include <cuda_runtime.h>

#include <math.h>
#include <cuda.h>
#include <builtin_types.h>
#include <drvapi_error_string.h>
#include "nvvm.h"
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>


#define checkCudaErrors(err)  __checkCudaErrors (err, __FILE__, __LINE__)

// These are the inline versions for all of the SDK helper functions
void __checkCudaErrors( CUresult err, const char *file, const int line ) {
    if( CUDA_SUCCESS != err) {
        fprintf(stderr, "checkCudaErrors() Driver API error = %04d \"%s\" from file <%s>, line %i.\n",
                err, getCudaDrvErrorString(err), file, line );
        exit(-1);
    }
}

char *loadSource(const char *fileName, size_t *size) {
    std::ifstream file(fileName);
    if (!file.is_open()) {
      std::cerr << fileName << "não encontrado.\n";
      return NULL;
    }
    std::string source((std::istreambuf_iterator<char>(file)),std::istreambuf_iterator<char>());

    *size = source.size();

    char *src = new char[source.length() + 1];
    strcpy(src, source.c_str());

    return src;
}

char *generatePTX(const char *ll, size_t size) {
    nvvmResult result;
    nvvmCU cu;

    result = nvvmInit();
    if (result != NVVM_SUCCESS) {
        fprintf(stderr, "nvvmInit: Failed\n");
	exit(-1);
    }

    result = nvvmCreateCU(&cu);
    if (result != NVVM_SUCCESS) {
        fprintf(stderr, "nvvmCreateCU: Failed\n");
        exit(-1);
    }

    result = nvvmCUAddModule(cu, ll, size);
    if (result != NVVM_SUCCESS) {
        fprintf(stderr, "nvvmCUAddModule: Failed\n");
        exit(-1);
    }

    result = nvvmCompileCU(cu,  0, NULL);
    if (result != NVVM_SUCCESS) {
        fprintf(stderr, "nvvmCompileCU: Failed\n");
        size_t LogSize;
        nvvmGetCompilationLogSize(cu, &LogSize);
        char *Msg = (char*)malloc(LogSize);
        nvvmGetCompilationLog(cu, Msg);
        fprintf(stderr, "%s\n", Msg);
        free(Msg);
        nvvmFini();
        exit(-1);
    }

    size_t PTXSize;
    result = nvvmGetCompiledResultSize(cu, &PTXSize);
    if (result != NVVM_SUCCESS) {
        fprintf(stderr, "nvvmGetCompiledResultSize: Failed\n");
        exit(-1);
    }

    char *PTX = (char*)malloc(PTXSize);
    result = nvvmGetCompiledResult(cu, PTX);
    if (result != NVVM_SUCCESS) {
        fprintf(stderr, "nvvmGetCompiledResult: Failed\n");
        free(PTX);
        exit(-1);
    }

    result = nvvmDestroyCU(&cu);
    if (result != NVVM_SUCCESS) {
      fprintf(stderr, "nvvmDestroyCU: Failed\n");
      free(PTX);
      exit(-1);
    }

    result = nvvmFini();
    if (result != NVVM_SUCCESS) {
      fprintf(stderr, "nvvmFini: Failed\n");
      free(PTX);
      exit(-1);
    }

    return PTX;
}



/// main - Program entry point
int main(int argc, char **argv) {
  CUdevice    cudaDevice = 0;
  CUmodule    cudaModule = 0;
  CUcontext   cudaContext = 0;
  CUfunction  function = 0;
  int         devCount = 0;

  /* Declaração e Inicialização de dados. */
  float* hostA = new float[16];
  float* hostB = new float[16];
  float* hostC = new float[16];

  for (unsigned i = 0; i != 16; ++i) {
    hostA[i] = (float)i;
    hostB[i] = (float)(2*i);
    hostC[i] = 0.0f;
  }

  /* Leitura do arquivo.ll.*/
  size_t size = 0;
  char *ll = NULL;
  ll = loadSource("sum-kernel.ll", &size);
  fprintf(stdout, "Arquivo IR carregado.\n");
  fprintf(stdout, "%s\n", ll);

  /* Gerando o PTX com a libnvvm. */
  char *ptx = generatePTX(ll, size);
  fprintf(stdout, "PTX gerado:\n");
  fprintf(stdout, "%s\n", ptx);

  /* Inicialização CUDA. */
  checkCudaErrors(cuInit(0));
  checkCudaErrors(cuDeviceGetCount(&devCount));
  checkCudaErrors(cuDeviceGet(&cudaDevice, 0));

  char name[128];
  checkCudaErrors(cuDeviceGetName(name, 128, cudaDevice));
  std::cout << "Using CUDA Device [0]: " << name << "\n";

  int devMajor, devMinor;
  checkCudaErrors(cuDeviceComputeCapability(&devMajor, &devMinor, cudaDevice));
  std::cout << "Device Compute Capability: " << devMajor << "." << devMinor << "\n";
  if (devMajor < 2) {
    std::cerr << "ERROR: Device 0 is not SM 2.0 or greater\n";
    return 1;
  }

  /* Criando um contexto. */
  checkCudaErrors(cuCtxCreate(&cudaContext, 0, cudaDevice));

  /* Carregando o módulo. */
  checkCudaErrors(cuModuleLoadDataEx(&cudaModule, ptx, 0, 0, 0));

  /* Recuperando a função kernel. */
  checkCudaErrors(cuModuleGetFunction(&function, cudaModule, "sum_kernel"));

  /* Alocação de Memória no disposito. */
  CUdeviceptr devBufferA;
  CUdeviceptr devBufferB;
  CUdeviceptr devBufferC;

  checkCudaErrors(cuMemAlloc(&devBufferA, sizeof(float)*16));
  checkCudaErrors(cuMemAlloc(&devBufferB, sizeof(float)*16));
  checkCudaErrors(cuMemAlloc(&devBufferC, sizeof(float)*16));

  /* Transferindo os dados para a memória do dispositivo. */
  checkCudaErrors(cuMemcpyHtoD(devBufferA, &hostA[0], sizeof(float)*16));
  checkCudaErrors(cuMemcpyHtoD(devBufferB, &hostB[0], sizeof(float)*16));

  /* Definição do arranjo de threads. */
  unsigned blockSizeX = 16;
  unsigned blockSizeY = 1;
  unsigned blockSizeZ = 1;
  unsigned gridSizeX  = 1;
  unsigned gridSizeY  = 1;
  unsigned gridSizeZ  = 1;

  /* Parâmetros da função kernel. */
  void *KernelParams[] = { &devBufferA, &devBufferB, &devBufferC };

  std::cout << "Launching kernel\n";

  /* Lançando a execução do kernel. */
  checkCudaErrors(cuLaunchKernel(function, gridSizeX, gridSizeY, gridSizeZ, blockSizeX, blockSizeY, blockSizeZ, 0, NULL, KernelParams, NULL));
/*
  // Set the kernel parameters
  checkCudaErrors(cuFuncSetBlockShape(function, 16, 1, 1));
  int paramOffset = 0;
  checkCudaErrors(cuParamSetv(function, paramOffset, &devBufferA, sizeof(devBufferA)));
  paramOffset += sizeof(devBufferA);

  checkCudaErrors(cuParamSetv(function, paramOffset, &devBufferB, sizeof(devBufferB)));
  paramOffset += sizeof(devBufferB);

  checkCudaErrors(cuParamSetv(function, paramOffset, &devBufferC, sizeof(devBufferC)));
  paramOffset += sizeof(devBufferC);

  checkCudaErrors(cuParamSetSize(function, paramOffset));

  // Launch the kernel
  int nBlocks = 1;
  checkCudaErrors(cuLaunchGrid(function, nBlocks, 1));
  */
  fprintf(stdout, "CUDA kernel launched\n");

  /* Recuperando o resultado. */
  checkCudaErrors(cuMemcpyDtoH(&hostC[0], devBufferC, sizeof(float)*16));

  /* Impressão do resultado. */
  std::cout << "Resultado:\n";
  for (unsigned i = 0; i != 16; ++i) {
    // std::cout << hostA[i] << " + " << hostB[i] << " = " << hostC[i] << "\n";
    fprintf(stdout, "%f + %f = %f \n", hostA[i], hostB[i], hostC[i]);
  }

  /* Liberando Memória do host. */
  delete [] hostA;
  delete [] hostB;
  delete [] hostC;

  /* Liberando Memória do dispositivo. */
  checkCudaErrors(cuMemFree(devBufferA));
  checkCudaErrors(cuMemFree(devBufferB));
  checkCudaErrors(cuMemFree(devBufferC));

  free(ll);
  free(ptx);

  /* Destruindo o contexto. */
  checkCudaErrors(cuModuleUnload(cudaModule));
  checkCudaErrors(cuCtxDestroy(cudaContext));
  /* Reinicializando o dispositivo. */
  cudaDeviceReset();

  return 0;
}
