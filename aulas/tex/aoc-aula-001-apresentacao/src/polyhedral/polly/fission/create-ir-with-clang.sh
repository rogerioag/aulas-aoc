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

export PATH_TO_LLVM_BUILD="/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/"

CC=${PATH_TO_LLVM_BUILD}/bin/clang
EXT=c

echo "--> 1. Create LLVM-IR from atax_function using clang."
${CC} -O${OPT_LEVEL} -S -emit-llvm ${BENCHMARK}.${EXT} -o ${BENCHMARK}.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/clang -O3 -S -emit-llvm atax.c -o atax.ll

echo ' Fim da execução de $0.'
