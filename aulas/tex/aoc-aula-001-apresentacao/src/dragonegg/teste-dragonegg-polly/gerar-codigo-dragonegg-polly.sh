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
export BASE=/dados/rogerio/USP/doutorado/prototipo-33
export CLOOG_INSTALL=${BASE}/cloog_install
export LLVM_BUILD=${BASE}/llvm_build

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${LLVM_BUILD}/lib:${CLOOG_INSTALL}/lib
export DRAGONEGG=${BASE}/dragonegg

DRAGONEGG_PARAMS="-fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fverbose-asm"
# POLLY_PARAMS="-fplugin-arg-dragonegg-llvm-option=-polly -fplugin-arg-dragonegg-llvm-option=-basicaa -fplugin-arg-dragonegg-llvm-option=-polly-prepare -fplugin-arg-dragonegg-llvm-option=-polly-detect"
POLLY_PARAMS="-fplugin-arg-dragonegg-llvm-option=-polly"



echo "Executando o DragonEgg + Polly."
# gcc -v e verificar se plugins são aceitos: --enable-plugin

# gcc -O3 -fplugin=/path/to/dragonegg.so -fplugin-arg-dragonegg-llvm-option=-load:/path/to/llvm/lib/LLVMPolly.so -fplugin-arg-dragonegg-llvm-option=-polly hello.c

${GCC} -S -O3 -fplugin=${DRAGONEGG}/dragonegg.so ${DRAGONEGG_PARAMS} -fplugin-arg-dragonegg-llvm-option=-load:${LLVM_BUILD}/lib/LLVMPolly.so ${POLLY_PARAMS} ${BENCHMARK} -o ${BENCHMARK}-dragonegg-loading-polly-ir.ll

# gera o executavel.
#${GCC} -O3 -fplugin=${DRAGONEGG}/dragonegg.so -fplugin-arg-dragonegg-llvm-option=-load:${LLVM_BUILD}/lib/LLVMPolly.so ${POLLY_PARAMS} ${BENCHMARK}

echo "Feito."

# opt -load /home/rogerio/prototipo-kg/llvm_build/lib/LLVMPolly.so  -basicaa -polly-prepare -polly-codegen /home/rogerio/prototipo-kg/llvm/tools/polly/test/Cloog/CodeGen/20100622.ll
# opt -load /home/rogerio/prototipo-kg/llvm_build/lib/LLVMPolly.so  -basicaa -polly-prepare -polly-detect -analyze  < /home/rogerio/prototipo-kg/llvm/tools/polly/test/Cloog/CodeGen/20100622.ll | not FileCheck /home/rogerio/prototipo-kg/llvm/tools/polly/test/Cloog/CodeGen/20100622.ll
