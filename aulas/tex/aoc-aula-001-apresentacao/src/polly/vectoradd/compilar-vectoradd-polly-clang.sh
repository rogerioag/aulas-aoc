#!/bin/bash -xe

if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <benchmark>.c" >&2
  exit 1
fi
if ! [ -e "$1" ]; then
  echo "$1 não encontrado." >&2
  exit 1
fi

BENCHMARK=$1
export BASE=/dados/rogerio/USP/doutorado/prototipo-trunk
export CLOOG_INSTALL=${BASE}/cloog_install
export LLVM_BUILD=${BASE}/llvm_build

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${LLVM_BUILD}/lib:${CLOOG_INSTALL}/lib

echo "Executando o clang + Polly."

${LLVM_BUILD}/bin/clang -Xclang -load -Xclang ${LLVM_BUILD}/lib/LLVMPolly.so -O3 -mllvm -polly -mllvm -polly-vectorizer=polly vectoradd.c -o vectoradd-clang-polly -lm

echo "Feito."

./vectoradd-clang-polly
