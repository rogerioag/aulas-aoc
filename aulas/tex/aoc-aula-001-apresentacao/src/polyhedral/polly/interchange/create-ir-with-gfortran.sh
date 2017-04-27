#!/bin/bash -xe

echo ' Início da execução de $0.'
if [ "$#" -ne 2 ]; then
  echo " Uso: $0 <benchmark>.f90 OPT_LEVEL" >&2
  exit 1
fi
if ! [ -e "$1" ]; then
  echo " $1 não encontrado." >&2
  exit 1
fi

#BENCHMARK=`echo $1 | awk -F"." '{print $1}'`
#extension="${filename##*.}"
BENCHMARK=$1
BENCHMARK="${BENCHMARK%.*}"
OPT_LEVEL=$2

CC=gfortran-4.8
EXT=f90
export PATH_TO_LLVM_BUILD="/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/"
export DRAGONEGG_HOME="/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin"


echo "--> 1. Create LLVM-IR using gfortran + dragonegg."
${CC} -S -O${OPT_LEVEL} -fplugin=${DRAGONEGG_HOME}/dragonegg.so -fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=${OPT_LEVEL} -fverbose-asm ${BENCHMARK}.${EXT} -o ${BENCHMARK}.ll

# gfortran-4.8 -S -O3 -fplugin=/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/dragonegg.so -fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=3 -fverbose-asm sincos.f90 -o sincos_function.ll
# gcc-4.8 -Dreal=float -std=c99 -S -O0 -fplugin=/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/dragonegg.so -fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fverbose-asm sincos.c -o sincos.ll

echo ' Fim da execução de $0.'
