all: run-sum-kernel-libnvvm.cpp drvapi_error_string.h
	g++ -I$(CUDA_HOME)/include -I. -I$(LIBNVVM_HOME) -o run-sum-kernel-libnvvm run-sum-kernel-libnvvm.cpp -L$(CUDA_HOME)/lib64 -lcuda -lcudart -L$(LIBNVVM_HOME) -lnvvm -Wl,-rpath,$(LIBNVVM_HOME) -I/usr/include/c++/4.7 -I/usr/include/c++/4.7/x86_64-linux-gnu/ -L/usr/local/cuda/lib64 -I/home/rogerio/NVIDIA_CUDA-5.5_Samples/NVIDIA_CUDA-5.5_Samples/common/inc/ -L/home/rogerio/NVIDIA_CUDA-5.5_Samples/NVIDIA_CUDA-5.5_Samples/common/lib

clean:
	rm -f run-sum-kernel-libnvvm
