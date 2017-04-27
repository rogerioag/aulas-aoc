#!/bin/sh -a

echo 'Início da execução de $0.'

export PATH_TO_LLVM_BUILD="/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/"

BENCHMARK=interchange

echo "--> 1. Create LLVM-IR from ${BENCHMARK}.c using clang."
mkdir -p ./phase-1
#./create-ir-with-clang.sh ${BENCHMARK}.c 3
./create-ir-with-gcc.sh ${BENCHMARK}.c 3
cp *.ll ./phase-1

echo "--> 1.b. Analyze ${BENCHMARK}.ll with PoLLy."
./analyze-with-polly.sh ${BENCHMARK}.ll ./phase-1

echo "--> 2. Preparing ${BENCHMARK}.ll to PoLLy."
mkdir -p ./phase-2
./prepare-to-polly.sh ${BENCHMARK}.ll
cp *.ll ./phase-2

echo "--> 2b. Analyze ${BENCHMARK}.ll with PoLLy."
./analyze-with-polly.sh ${BENCHMARK}_preopt.ll ./phase-2

echo "--> 3. Analyze ${BENCHMARK}.ll with PoLLy."
mkdir -p ./phase-3
./analyze-with-polly.sh ${BENCHMARK}_preopt_prepare.ll ./phase-3

echo "--> 4. Independent Blocks with PoLLy."
mkdir -p ./phase-4
./indep-blocks-with-polly.sh ${BENCHMARK}_preopt_prepare.ll
cp *.ll ./phase-4

echo "--> 3. Analyze ${BENCHMARK}.ll with PoLLy."
./analyze-with-polly.sh ${BENCHMARK}_preopt_prepare_indep_blocks.ll ./phase-4

echo "--> 5.Extracting loops to functions."
mkdir -p ./phase-5
./extract-loops-to-functions.sh ${BENCHMARK}_preopt_prepare_indep_blocks.ll
cp *.ll ./phase-5

echo "--> 6.Extracting loop function to separate module."
mkdir -p ./phase-6
# ./extract-loopfunction-to-module.sh ${BENCHMARK}_preopt_prepare_indep_blocks_loop_extract.ll main_1
./extract-loopfunction-to-module.sh ${BENCHMARK}_preopt_prepare_indep_blocks_loop_extract.ll "main_<bb 5>.preheader"
cp *.ll ./phase-6

echo "--> 3. Analyze ${BENCHMARK}.ll with PoLLy."
./analyze-with-polly.sh ${BENCHMARK}_preopt_prepare_indep_blocks_loop_extract_without_"main_<bb 5>.preheader".ll ./phase-6

./analyze-with-polly.sh ${BENCHMARK}_preopt_prepare_indep_blocks_loop_extract_"main_<bb 5>.preheader".ll ./phase-6

echo 'Fim da execução de $0.'
