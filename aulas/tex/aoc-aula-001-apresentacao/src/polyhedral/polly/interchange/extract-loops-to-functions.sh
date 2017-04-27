#!/bin/bash -xe

echo ' Início da execução de $0.'
if [ "$#" -ne 1 ]; then
  echo " Uso: $0 <benchmark>.ll" >&2
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

export LLVM_BASE="/dados/rogerio/USP/doutorado/prototipo-34-gpu"

export PATH_TO_LLVM_BUILD="${LLVM_BASE}/llvm_build"
export PATH_TO_POLLY_LIB="${PATH_TO_LLVM_BUILD}/lib"

export LD_LIBRARY_PATH="${PATH_TO_POLLY_LIB}:${LLVM_BASE}/cloog_install/lib:$LD_LIBRARY_PATH"

echo "--> 5. Load Polly automatically when calling the 'opt' tool."
#alias opt="${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

echo "--> 5.Extracting loops to functions."
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -loop-extract -S vectoradd.ll > vectoradd.loop.extract.ll
${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -loop-extract -S ${BENCHMARK}.ll > ${BENCHMARK}_loop_extract.ll

echo ' Fim da execução de $0.'