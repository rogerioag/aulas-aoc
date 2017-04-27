# !/bin/bash

source /usr/local/par4all/etc/par4all-rc.sh

PROGDIR=`pwd`

PROGNAME=`basename $PROGDIR`

rm ../*.zip

# CUDA sem Optimizacao.
make clean
echo "Gerando CUDA sem otimizacao..."
p4a -v -k --cuda $PROGNAME.c -o $PROGNAME-cuda
echo "Executando $PROGNAME-cuda "
./$PROGNAME-cuda

# CUDA com Optimizacao.
cd $PROGDIR
make clean
echo "Gerando CUDA com otimizacao..."
p4a -v -k --cuda --com-optimization $PROGNAME.c -o $PROGNAME-cuda-opt
echo "Executando $PROGNAME-cuda-opt "
./$PROGNAME-cuda-opt

# OpenMP.
cd $PROGDIR
make clean
echo "Gerando OpenMP..."
p4a -v -k --openmp --c-flags="-lm" --cpp-flags="-lm" --cxx-flags="-lm" --ld-flags="-lm" $PROGNAME.c -o $PROGNAME-openmp
echo "Executando $PROGNAME-openmp "
./$PROGNAME-openmp

# OpenMP como accel.
cd $PROGDIR
make clean
echo "Gerando OpenMP como accel..."
p4a -v -k --accel --openmp --c-flags="-lm" --cpp-flags="-lm" --cxx-flags="-lm" --ld-flags="-lm" $PROGNAME.c -o $PROGNAME-openmp-accel
echo "Executando $PROGNAME-openmp-accel "
./$PROGNAME-openmp-accel

# OpenCL.
cd $PROGDIR
make clean
echo "Gerando OpenCL..."
p4a -v -k --opencl --c-flags="-lm" --cpp-flags="-lm" --cxx-flags="-lm" --ld-flags="-lm" $PROGNAME.c -o $PROGNAME-opencl
echo "Executando $PROGNAME-opencl "
./$PROGNAME-opencl
