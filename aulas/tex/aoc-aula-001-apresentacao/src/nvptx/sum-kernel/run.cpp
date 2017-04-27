#include <iostream>
#include <fstream>
#include <cassert>

// CUDA driver & runtime
#include <cuda.h>
#include <cuda_runtime.h>


void checkCudaErrors(CUresult err) {
  assert(err == CUDA_SUCCESS);
}

/// main - Program entry point
int main(int argc, char **argv) {
  CUdevice    device;
  CUmodule    cudaModule;
  CUcontext   context;
  CUfunction  function;
  CUlinkState linker;
  int         devCount;

  // Declaracao dos dados na memoria principal.
  float* hostA = new float[16];
  float* hostB = new float[16];
  float* hostC = new float[16];

  // Inicializando valores.
  for (unsigned i = 0; i != 16; ++i) {
    hostA[i] = (float)i;
    hostB[i] = (float)(2*i);
    hostC[i] = 0.0f;
  }

  // Inicializacao CUDA.
  checkCudaErrors(cuInit(0));
  checkCudaErrors(cuDeviceGetCount(&devCount));
  checkCudaErrors(cuDeviceGet(&device, 0));

  char name[128];
  checkCudaErrors(cuDeviceGetName(name, 128, device));
  std::cout << "Using CUDA Device [0]: " << name << "\n";

  int devMajor, devMinor;
  checkCudaErrors(cuDeviceComputeCapability(&devMajor, &devMinor, device));
  std::cout << "Device Compute Capability: " << devMajor << "." << devMinor << "\n";
  if (devMajor < 2) {
    std::cerr << "ERROR: Device 0 is not SM 2.0 or greater\n";
    return 1;
  }

  // Carregando o arquivo PTX.
  std::ifstream t("sum-kernel.ptx");
  if (!t.is_open()) {
    std::cerr << "sum-kernel.ptx not found\n";
    return 1;
  }
  std::string str((std::istreambuf_iterator<char>(t)),std::istreambuf_iterator<char>());

  // Criando o Driver Context.
  checkCudaErrors(cuCtxCreate(&context, 0, device));

  // Criando um modulo.
  checkCudaErrors(cuModuleLoadDataEx(&cudaModule, str.c_str(), 0, 0, 0));

  // Get kernel function.
  checkCudaErrors(cuModuleGetFunction(&function, cudaModule, "sum_kernel"));

  // Alocacao de Memoria no disposito.
  CUdeviceptr devBufferA;
  CUdeviceptr devBufferB;
  CUdeviceptr devBufferC;

  checkCudaErrors(cuMemAlloc(&devBufferA, sizeof(float)*16));
  checkCudaErrors(cuMemAlloc(&devBufferB, sizeof(float)*16));
  checkCudaErrors(cuMemAlloc(&devBufferC, sizeof(float)*16));

  // Transferindo os dados para a memoria do dispositivo.
  checkCudaErrors(cuMemcpyHtoD(devBufferA, &hostA[0], sizeof(float)*16));
  checkCudaErrors(cuMemcpyHtoD(devBufferB, &hostB[0], sizeof(float)*16));

  unsigned blockSizeX = 16;
  unsigned blockSizeY = 1;
  unsigned blockSizeZ = 1;
  unsigned gridSizeX  = 1;
  unsigned gridSizeY  = 1;
  unsigned gridSizeZ  = 1;

  // Parametros do kernel.
  void *KernelParams[] = { &devBufferA, &devBufferB, &devBufferC };

  std::cout << "Launching kernel\n";

  // Lancando a execucao do kernel.
  checkCudaErrors(cuLaunchKernel(function, gridSizeX, gridSizeY, gridSizeZ, blockSizeX, blockSizeY, blockSizeZ, 0, NULL, KernelParams, NULL));

  // Recuperando os dados do resultado.
  checkCudaErrors(cuMemcpyDtoH(&hostC[0], devBufferC, sizeof(float)*16));

  // Impressao do resultado.
  std::cout << "Resultado:\n";
  for (unsigned i = 0; i != 16; ++i) {
    std::cout << hostA[i] << " + " << hostB[i] << " = " << hostC[i] << "\n";
  }

  // Liberando Memoria do host.
  delete [] hostA;
  delete [] hostB;
  delete [] hostC;

  // Liberando Memoria do dispositivo.
  checkCudaErrors(cuMemFree(devBufferA));
  checkCudaErrors(cuMemFree(devBufferB));
  checkCudaErrors(cuMemFree(devBufferC));
  checkCudaErrors(cuModuleUnload(cudaModule));
  checkCudaErrors(cuCtxDestroy(context));

  cudaDeviceReset();

  return 0;
}
