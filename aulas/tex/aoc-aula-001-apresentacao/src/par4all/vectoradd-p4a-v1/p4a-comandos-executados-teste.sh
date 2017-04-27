# !/bin/bash
source /usr/local/par4all/etc/par4all-rc.sh

# CUDA sem Optimizacao.
make clean
p4a -v -k --cuda vectoradd.c -o vectoradd-cuda
./vectoradd-cuda

# CUDA com Optimizacao.
make clean
p4a -v -k --cuda --com-optimization vectoradd.c -o vectoradd-cuda-opt
./vectoradd-cuda-opt

# OpenMP.
make clean
p4a -v -k --c-flags="-lm" --cpp-flags="-lm" --cxx-flags="-lm" --ld-flags="-lm" --openmp vectoradd.c -o vectoradd-openmp
./vectoradd-openmp

# OpenMP como accel.
p4a -v -k --accel --openmp --c-flags="-lm" --cpp-flags="-lm" --cxx-flags="-lm" --ld-flags="-lm" vectoradd.c -o vectoradd-openmp-accel
./vectoradd-openmp-accel

# OpenCL.
p4a -v -k --opencl --c-flags="-lm" --cpp-flags="-lm" --cxx-flags="-lm" --ld-flags="-lm" vectoradd.c -o vectoradd-opencl
./vectoradd-opencl
