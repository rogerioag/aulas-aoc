#!/bin/bash -xe

echo ' Início da execução de $0.'
if [ "$#" -ne 2 ]; then
  echo " Uso: $0 <benchmark>.c OPT_LEVEL" >&2
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

CC=gcc-4.8
EXT=c
export PATH_TO_LLVM_BUILD="/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/"
export DRAGONEGG_HOME="/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin"

echo "--> 1. Create LLVM-IR from vectoradd_function.c using gcc + dragonegg."
${CC} -S -O${OPT_LEVEL} -fplugin=${DRAGONEGG_HOME}/dragonegg.so -fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=${OPT_LEVEL} -fverbose-asm ${BENCHMARK}.${EXT} -o ${BENCHMARK}.ll
# gcc-4.8 -S -O3 -fplugin=/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/dragonegg.so -fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=3 -fverbose-asm vectoradd.c -o vectoradd.ll

echo ' Fim da execução de $0.'
