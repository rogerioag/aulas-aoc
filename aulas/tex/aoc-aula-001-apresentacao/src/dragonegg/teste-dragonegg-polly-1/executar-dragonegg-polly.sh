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
export GCC=/usr/bin/gcc-4.7
export BASE=/dados/rogerio/USP/doutorado/prototipo
export CLOOG_INSTALL=${BASE}/cloog_install
export LLVM_BUILD=${BASE}/llvm_build

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${LLVM_BUILD}/lib:${CLOOG_INSTALL}/lib
export DRAGONEGG=${BASE}/dragonegg

DRAGONEGG_PARAMS="-fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fverbose-asm"
POLLY_PARAMS="-basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen -polly-vectorizer=polly -enable-polly-openmp"

echo "Executando o DragonEgg."
${GCC} ${BENCHMARK} -S -O3 -fplugin=${DRAGONEGG}/dragonegg.so ${DRAGONEGG_PARAMS} -o ${BENCHMARK}-dragonegg-ir.ll

echo "Executando o Polly."
${LLVM_BUILD}/bin/opt -load ${LLVM_BUILD}/lib/LLVMPolly.so ${POLLY_PARAMS} ${BENCHMARK}-dragonegg-ir.ll -S -o ${BENCHMARK}-dragonegg-polly-ir.ll

echo "Feito."
