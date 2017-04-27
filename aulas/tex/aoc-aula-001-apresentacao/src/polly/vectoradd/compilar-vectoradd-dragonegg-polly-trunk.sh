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
export GCC=/usr/bin/gcc-4.6
export BASE=/dados/rogerio/USP/doutorado/prototipo-trunk
export CLOOG_INSTALL=${BASE}/cloog_install
export LLVM_BUILD=${BASE}/llvm_build

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${LLVM_BUILD}/lib:${CLOOG_INSTALL}/lib
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/dados/rogerio/USP/doutorado/prototipo-tar/llvm_build/lib:/dados/rogerio/USP/doutorado/prototipo-tar/cloog_install/lib

export DRAGONEGG=${BASE}/dragonegg
#export DRAGONEGG=/dados/rogerio/USP/doutorado/prototipo-tar/dragonegg
export PATH_TO_POLLY_LIB=${LLVM_BUILD}/lib

echo "--> 1. Emiting the LLVM-IR from C code using GCC+DragonEgg."
${GCC} ${BENCHMARK} -S -O0 -fplugin=${DRAGONEGG}/dragonegg.so -fplugin-arg-dragonegg-emit-ir -o ${BENCHMARK}.ir.s

echo "--> 2. Load Polly automatically when calling the 'opt' tool"
#alias opt='${LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so'
#alias llc='${LLVM_BUILD}/bin/llc'
export OPT="${LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"
export LLC="${LLVM_BUILD}/bin/llc"
#export TIME="time -f '%E real, %U user, %S sys'"
export TIME='time'

echo "--> 3. Prepare the LLVM-IR for Polly"
${OPT} -S -mem2reg -loop-simplify -polly-indvars ${BENCHMARK}.ir.s > ${BENCHMARK}.preopt.ll

echo "--> 4. Show the SCoPs detected by Polly"
${OPT} -basicaa -polly-cloog -analyze -q ${BENCHMARK}.preopt.ll

echo "--> 5.1 Highlight the detected SCoPs in the CFGs of the program"
# We only create .dot files, as directly -view-scops directly calls graphviz
# which would require user interaction to continue the script.
# opt -basicaa -view-scops -disable-output ${BENCHMARK}.preopt.ll
${OPT} -basicaa -dot-scops -disable-output ${BENCHMARK}.preopt.ll

echo "--> 5.2 Highlight the detected SCoPs in the CFGs of the program (print \
no instructions)"
# We only create .dot files, as directly -view-scops-only directly calls
# graphviz which would require user interaction to continue the script.
# opt -basicaa -view-scops-only -disable-output ${BENCHMARK}.preopt.ll
${OPT} -basicaa -dot-scops-only -disable-output ${BENCHMARK}.preopt.ll

echo "--> 5.3 Create .png files from the .dot files"
for i in `ls *.dot`; do dot -Tpng $i > $i.png; done

echo "--> 6. View the polyhedral representation of the SCoPs"
${OPT} -basicaa -polly-scops -analyze ${BENCHMARK}.preopt.ll

echo "--> 7. Show the dependences for the SCoPs"
${OPT} -basicaa -polly-dependences -analyze ${BENCHMARK}.preopt.ll

echo "--> 8. Export jscop files"
${OPT} -basicaa -polly-export-jscop ${BENCHMARK}.preopt.ll

echo "--> 9. Import the updated jscop files and print the new SCoPs. (optional)"
${OPT} -basicaa -polly-import-jscop -polly-cloog -analyze ${BENCHMARK}.preopt.ll
${OPT} -basicaa -polly-import-jscop -polly-cloog -analyze ${BENCHMARK}.preopt.ll -polly-import-jscop-postfix=interchanged
${OPT} -basicaa -polly-import-jscop -polly-cloog -analyze ${BENCHMARK}.preopt.ll -polly-import-jscop-postfix=interchanged+tiled
${OPT} -basicaa -polly-import-jscop -polly-cloog -analyze ${BENCHMARK}.preopt.ll -polly-import-jscop-postfix=interchanged+tiled+vector

echo "--> 10. Codegenerate the SCoPs"
${OPT} -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged -polly-codegen ${BENCHMARK}.preopt.ll | ${OPT} -O3 -S > ${BENCHMARK}.polly.interchanged.ll

${OPT} -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged+tiled -polly-codegen ${BENCHMARK}.preopt.ll | ${OPT} -O3 -S > ${BENCHMARK}.polly.interchanged+tiled.ll

# Separando para pegar o código.
# ${OPT} -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen ${BENCHMARK}.preopt.ll -polly-vectorizer=polly | ${OPT} -O3 > ${BENCHMARK}.polly.interchanged+tiled+vector.ll
${OPT} -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen ${BENCHMARK}.preopt.ll -polly-vectorizer=polly | ${OPT} -O3 -S > ${BENCHMARK}.polly.interchanged+tiled+vector.ll

${OPT} -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen ${BENCHMARK}.preopt.ll -polly-vectorizer=polly -enable-polly-openmp | ${OPT} -O3 > ${BENCHMARK}.polly.interchanged+tiled+vector+openmp.ll

${OPT} ${BENCHMARK}.preopt.ll | ${OPT} -O3 -S > ${BENCHMARK}.normalopt.ll

echo "--> 11. Create the executables"
${LLC} ${BENCHMARK}.polly.interchanged.ll -o ${BENCHMARK}.polly.interchanged.s && ${GCC} -lm ${BENCHMARK}.polly.interchanged.s -o ${BENCHMARK}.polly.interchanged.exe

${LLC} ${BENCHMARK}.polly.interchanged+tiled.ll -o ${BENCHMARK}.polly.interchanged+tiled.s && ${GCC} -lm ${BENCHMARK}.polly.interchanged+tiled.s -o ${BENCHMARK}.polly.interchanged+tiled.exe

${LLC} ${BENCHMARK}.polly.interchanged+tiled+vector.ll -o ${BENCHMARK}.polly.interchanged+tiled+vector.s && ${GCC} -lm ${BENCHMARK}.polly.interchanged+tiled+vector.s -o ${BENCHMARK}.polly.interchanged+tiled+vector.exe

${LLC} ${BENCHMARK}.polly.interchanged+tiled+vector+openmp.ll -o ${BENCHMARK}.polly.interchanged+tiled+vector+openmp.s && ${GCC} -lgomp -lm ${BENCHMARK}.polly.interchanged+tiled+vector+openmp.s -o ${BENCHMARK}.polly.interchanged+tiled+vector+openmp.exe

${LLC} ${BENCHMARK}.normalopt.ll -o ${BENCHMARK}.normalopt.s && ${GCC} -lm ${BENCHMARK}.normalopt.s -o ${BENCHMARK}.normalopt.exe

echo "--> 12. Compare the runtime of the executables"

echo "time ./${BENCHMARK}.normalopt.exe"
${TIME} ./${BENCHMARK}.normalopt.exe
echo "time ./${BENCHMARK}.polly.interchanged.exe"
${TIME} ./${BENCHMARK}.polly.interchanged.exe
echo "time ./${BENCHMARK}.polly.interchanged+tiled.exe"
${TIME} ./${BENCHMARK}.polly.interchanged+tiled.exe
echo "time ./${BENCHMARK}.polly.interchanged+tiled+vector.exe"
${TIME} ./${BENCHMARK}.polly.interchanged+tiled+vector.exe
echo "time ./${BENCHMARK}.polly.interchanged+tiled+vector+openmp.exe"
${TIME} ./${BENCHMARK}.polly.interchanged+tiled+vector+openmp.exe
