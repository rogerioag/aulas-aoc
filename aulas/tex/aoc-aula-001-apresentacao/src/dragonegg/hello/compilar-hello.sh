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


# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib:/dados/rogerio/USP/doutorado/prototipo-34-gpu/cloog_install/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${LLVM_BUILD}/lib:${CLOOG_INSTALL}/lib
export DRAGONEGG=${BASE}/dragonegg



echo "Emiting the GCC assembly."
# gcc hello.c -S -O1 -o hello-gcc.s
# Gerar com diretivas de controles do GCC.
${GCC} hello.c -S -O0 -o hello-gcc.s
# Gerar sem diretivas de controle do GCC.
${GCC} hello.c -S -O0 -fno-asynchronous-unwind-tables -o hello-gcc-sem-diretivas-gcc.s

echo "Emiting the GCC assembly non optimized by LLVM."
# gcc hello.c -S -O1 -fplugin=./dragonegg.so -o hello-gcc-opt-llvm.s
${GCC} ${BENCHMARK} -S -O1 -fno-asynchronous-unwind-tables -fplugin=${DRAGONEGG}/dragonegg.so -o ${BENCHMARK}-gcc-opt-llvm.s

echo "Executando o DragonEgg."
echo "Emiting the LLVM IR: gcc-O0-llvm-O0"
DRAGONEGG_PARAMS="-fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fverbose-asm"
${GCC} ${BENCHMARK} -S -O0 -fplugin=${DRAGONEGG}/dragonegg.so ${DRAGONEGG_PARAMS} -o ${BENCHMARK}-gcc-O0-dragonegg-O0-ir.ll

echo "Emiting the LLVM IR: gcc-O0-llvm-O1"
DRAGONEGG_PARAMS="-fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=1 -fverbose-asm"
# gcc hello.c -S -O1 -fplugin=./dragonegg.so -fplugin-arg-dragonegg-emit-ir -o hello-ir.s
${GCC} ${BENCHMARK} -S -O0 -fplugin=${DRAGONEGG}/dragonegg.so ${DRAGONEGG_PARAMS} -o ${BENCHMARK}-gcc-O0-dragonegg-O1-ir.ll

echo "Emiting the LLVM IR: gcc-O1-llvm-O0"
DRAGONEGG_PARAMS="-fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fverbose-asm"
# gcc hello.c -S -O1 -fplugin=./dragonegg.so -fplugin-arg-dragonegg-emit-ir -o hello-ir.s
${GCC} ${BENCHMARK} -S -O1 -fplugin=${DRAGONEGG}/dragonegg.so ${DRAGONEGG_PARAMS} -o ${BENCHMARK}-gcc-O1-dragonegg-O0-ir.ll

echo "Emiting the LLVM IR: gcc-O1-llvm-O1"
DRAGONEGG_PARAMS="-fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=1 -fverbose-asm"
${GCC} ${BENCHMARK} -S -O1 -fplugin=${DRAGONEGG}/dragonegg.so ${DRAGONEGG_PARAMS} -o ${BENCHMARK}-gcc-O1-dragonegg-O1-ir.ll

echo "Feito."
