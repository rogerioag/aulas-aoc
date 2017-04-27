#!/bin/bash -xe

echo ' Início da execução de $0.'
if [ "$#" -ne 2 ]; then
  echo " Uso: $0 <benchmark>.ll dir-results" >&2
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

DIR_RES=$2
mkdir -p ${DIR_RES}

echo "--> 3. Load Polly automatically when calling the 'opt' tool."
#alias opt="${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

echo "--> 3a. Show the SCoPs detected by Polly"
${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -basicaa -polly-cloog -analyze -q ${BENCHMARK}.ll > ${DIR_RES}/${BENCHMARK}_cloog_analyze.txt
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-cloog -analyze -q atax_preopt.ll > fase-3/atax_preopt_cloog.txt

echo "--> 3a. Analise com AST."
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -polly-import-jscop-dir=/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm/tools/polly/test/Isl/Ast -basicaa -polly-import-jscop -polly-ast -polly-ast-detect-parallel -analyze < vectoradd.preopt.ll
# ${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -polly-import-jscop-dir=. -basicaa -polly-import-jscop -polly-ast -polly-ast-detect-parallel -analyze ${BENCHMARK}.ll > ${DIR_RES}/${BENCHMARK}_ast_analyze.txt
${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -basicaa -polly-ast -polly-ast-detect-parallel -analyze ${BENCHMARK}.ll > ${DIR_RES}/${BENCHMARK}_ast_analyze.txt

echo "--> 3b. View the polyhedral representation of the SCoPs."
${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -basicaa -polly-scops -analyze ${BENCHMARK}.ll > ${DIR_RES}/${BENCHMARK}_scops_analyze.txt
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-scops -analyze atax_preopt.ll

echo "--> 3c. Show the dependences for the SCoPs."
${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -basicaa -polly-dependences -analyze ${BENCHMARK}.ll > ${DIR_RES}/${BENCHMARK}_polly_deps.txt
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-dependences -analyze sincos_function_preopt.ll > fase-3/sincos_function_preopt_polly_deps.txt

echo "--> 3c. Show the ScopInfo."
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so  -basicaa -polly-prepare  -polly-analyze-ir  -analyze < vectoradd.preopt.ll
${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -basicaa -polly-prepare  -polly-analyze-ir -analyze ${BENCHMARK}.ll > ${DIR_RES}/${BENCHMARK}_scopinfo_analyze.txt

echo "--> 3d. Show the Dependences: value-based."
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-dependences -analyze -polly-dependences-analysis-type=value-based < vectoradd.preopt.ll
${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -basicaa -polly-dependences -analyze -polly-dependences-analysis-type=value-based ${BENCHMARK}.ll > ${DIR_RES}/${BENCHMARK}_dep_analysis_value_based.txt

echo "--> 3d. Show the Dependences: memory-based."
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-dependences -analyze -polly-dependences-analysis-type=memory-based < vectoradd.preopt.ll
${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -basicaa -polly-dependences -analyze -polly-dependences-analysis-type=memory-based ${BENCHMARK}.ll > ${DIR_RES}/${BENCHMARK}_dep_analysis_memory_based.txt


echo "--> 4. Export jscop files."
#opt -basicaa -polly-export-jscop vectoradd.preopt.ll
#${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -basicaa -polly-export-jscop ${BENCHMARK}.ll
#mkdir -p ${DIR_RES}/${BENCHMARK}_jscops
#mv *.jscop ${DIR_RES}/${BENCHMARK}_jscops


echo "-->  3e. Highlight the detected SCoPs in the CFGs of the program."
echo "     To view: opt -basicaa -view-scops -disable-output module.ll"
# We only create .dot files, as directly -view-scops directly calls graphviz
# which would require user interaction to continue the script.
# opt -basicaa -view-scops -disable-output vectoradd.preopt.ll
${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -basicaa -dot-scops -disable-output ${BENCHMARK}.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-scops -disable-output sincos_function_preopt.ll

# opt -basicaa -dot-scops-only -disable-output vectoradd.preopt.ll

# opt -basicaa -dot-cfg -disable-output vectoradd.preopt.ll
${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -basicaa -dot-cfg -disable-output ${BENCHMARK}.ll

echo "     Para callgraph ver o comando no script. "
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so  -basicaa -view-callgraph -disable-output vectoradd.preopt.ll
${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so -basicaa -dot-callgraph -disable-output ${BENCHMARK}.ll

echo "-->  Create .png files from the .dot files"
for i in `ls *.dot`; do
  extension="${i##*.}"
  nome="${i%.*}"
  tmp=`echo $nome | sed 's/\./\_/'`
  newname=${DIR_RES}_${tmp}_analyze.${extension}

  mv ${i} ${newname}

  scop_name="${newname%.*}"

  dot -Tpng ${newname} > ${scop_name}.png;
done

mkdir -p ${DIR_RES}/${BENCHMARK}/dot
mkdir -p ${DIR_RES}/${BENCHMARK}/png

mv *.dot ${DIR_RES}/${BENCHMARK}/dot
mv *.png ${DIR_RES}/${BENCHMARK}/png

echo ' Fim da execução de $0.'
