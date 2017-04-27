// CUDA driver & runtime.
#include <cuda.h>
#include <cuda_runtime.h>

int main(int argc, char **argv) {
  CUdevice    device;
  CUmodule    cudaModule;
  CUcontext   context;
  CUfunction  function;
  CUlinkState linker;
  int         devCount;

  /* Declaração e Inicialização de dados suprimida.*/

  /* Inicialização CUDA. */
  cuInit(0);
  cuDeviceGetCount(&devCount);
  cuDeviceGet(&device, 0);

  /* Carregando o arquivo PTX. */
  std::ifstream t("sum-kernel.ptx");
  std::string str((std::istreambuf_iterator<char>(t)),std::istreambuf_iterator<char>());

  /* Criando um contexto. */
  cuCtxCreate(&context, 0, device);

  /* Criando um módulo. */
  cuModuleLoadDataEx(&cudaModule, str.c_str(), 0, 0, 0);

  /* Recuperando a função kernel. */
  cuModuleGetFunction(&function, cudaModule, "sum_kernel");

  /* Alocação de Memória no disposito. */
  CUdeviceptr devBufferA;
  CUdeviceptr devBufferB;
  CUdeviceptr devBufferC;

  cuMemAlloc(&devBufferA, N * sizeof(float));
  cuMemAlloc(&devBufferB, N * sizeof(float));
  cuMemAlloc(&devBufferC, N * sizeof(float));

  /* Transferindo os dados para a memória do dispositivo. */
  cuMemcpyHtoD(devBufferA, &hostA[0], N * sizeof(float));
  cuMemcpyHtoD(devBufferB, &hostB[0], N * sizeof(float));

  /* Definição do arranjo de threads. */
  unsigned blockSizeX = 16;
  unsigned blockSizeY = 1;
  unsigned blockSizeZ = 1;
  unsigned gridSizeX  = 1;
  unsigned gridSizeY  = 1;
  unsigned gridSizeZ  = 1;

  /* Parâmetros da função kernel. */
  void *KernelParams[] = { &devBufferA, &devBufferB, &devBufferC };

  /* Lançando a execução do kernel. */
  cuLaunchKernel(function, gridSizeX, gridSizeY, gridSizeZ, blockSizeX, blockSizeY, blockSizeZ, 0, NULL, KernelParams, NULL);

  /* Recuperando o resultado. */
  cuMemcpyDtoH(&hostC[0], devBufferC, N * sizeof(float));

  /* Impressão do resultado. */
  std::cout << "Resultado:\n";
  for (unsigned i = 0; i != 16; ++i) {
    std::cout << hostA[i] << " + " << hostB[i] << " = " << hostC[i] << "\n";
  }

  /* Liberando Memória do host. */
  delete [] hostA;
  delete [] hostB;
  delete [] hostC;

  /* Liberando Memória do dispositivo. */
  cuMemFree(devBufferA);
  cuMemFree(devBufferB);
  cuMemFree(devBufferC);

  /* Destruindo o contexto. */
  cuModuleUnload(cudaModule);
  cuCtxDestroy(context);
  /* Reinicializando o dispositivo. */
  cudaDeviceReset();

  return 0;
}
