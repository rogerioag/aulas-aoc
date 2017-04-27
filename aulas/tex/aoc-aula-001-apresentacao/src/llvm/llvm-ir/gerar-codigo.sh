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
export BASE=/dados/rogerio/USP/doutorado/prototipo-tar
export LLVM_BUILD=${BASE}/llvm_build

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${LLVM_BUILD}/lib

export GCC=/usr/bin/gcc-4.6

echo "Gerando um .ll com o clang."
${LLVM_BUILD}/bin/clang -S -emit-llvm ${BENCHMARK} -o ${BENCHMARK}.ll

echo "Gerando um .bc com o opt."
${LLVM_BUILD}/bin/opt ${BENCHMARK}.ll -o ${BENCHMARK}.bc

echo "Gerando um .ll a partir de um .bc"
${LLVM_BUILD}/bin/opt -S ${BENCHMARK}.bc -o ${BENCHMARK}.bc.ll

echo "Aplicando otimizações com opt."
${LLVM_BUILD}/bin/opt -O1 -S ${BENCHMARK}.ll -o ${BENCHMARK}.opt.O1.ll

${LLVM_BUILD}/bin/opt -O2 -S ${BENCHMARK}.ll -o ${BENCHMARK}.opt.O2.ll

${LLVM_BUILD}/bin/opt -O3 -S ${BENCHMARK}.ll -o ${BENCHMARK}.opt.O3.ll

echo "Gerando um .s (assembly nativo)."
${LLVM_BUILD}/bin/llc ${BENCHMARK}.ll -o ${BENCHMARK}.s

echo "Gerando um executável com o GCC."
${GCC} ${BENCHMARK}.s -o ${BENCHMARK}.exe

echo "Executando..."
# ./main.c.exe

# echo ":"$?

echo "lli - Just in time compiler."
${LLVM_BUILD}/bin/lli ${BENCHMARK}.ll

# echo $?

echo "Feito."







