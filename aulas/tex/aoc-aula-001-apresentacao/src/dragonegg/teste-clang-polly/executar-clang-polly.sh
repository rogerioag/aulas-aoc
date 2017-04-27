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
export BASE=/dados/rogerio/USP/doutorado/prototipo
export CLOOG_INSTALL=${BASE}/cloog_install
export LLVM_BUILD=${BASE}/llvm_build

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${LLVM_BUILD}/lib:${CLOOG_INSTALL}/lib

# POLLY_PARAMS="-mllvm -polly-export ${BENCHMARK}-clang-polly.scop"
POLLY_PARAMS="-mllvm -polly -mllvm -polly-vectorizer=polly -mllvm -polly-report -mllvm -polly-show"
CPPFLAGS="-Xclang -load -Xclang ${LLVM_BUILD}/lib/LLVMPolly.so"
CLANG_PARAMS="-lm -O3"

echo "Executando clang + polly."
# ./clang -lm  -Xclang -load -Xclang ../lib/LLVMPolly.so -O3 -mllvm -polly -mllvm -polly-vectorizer=polly /dados/Dropbox/doutorado/leituras/revisao/src/par4all/vectoradd-p4a/vectoradd-opencl/vectoradd.c -o vectoradd -polly-export teste
# ${LLVM_BUILD}/bin/clang -Xclang -load -Xclang ${LLVM_BUILD}/lib/LLVMPolly.so ${POLLY_PARAMS} ${BENCHMARK} -o ${BENCHMARK}-clang-polly.exe -polly-export ${BENCHMARK}-clang-polly.scop
${LLVM_BUILD}/bin/clang ${CPPFLAGS} ${POLLY_PARAMS} ${BENCHMARK} -o ${BENCHMARK}-clang-polly.exe

echo "Feito."
