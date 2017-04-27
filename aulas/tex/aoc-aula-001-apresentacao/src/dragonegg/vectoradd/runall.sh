#!/bin/sh -a

export PATH_TO_LLVM_BUILD="/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/"

echo "--> 1. Create LLVM-IR from C"
${PATH_TO_LLVM_BUILD}/bin/clang -S -emit-llvm vectoradd.c -o vectoradd.ll
#/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/clang -S -emit-llvm vectoradd.c -o vectoradd.ll

echo "--> 2. Load Polly automatically when calling the 'opt' tool"
export PATH_TO_POLLY_LIB="/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/"

alias opt="${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

#/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so

# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen vectoradd.preopt.ll -polly-vectorizer=polly -enable-polly-openmp | /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -O3 -S > vectoradd.polly.interchanged+tiled+vector+openmp.ll

# echo "Extracting loops to functions."
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so vectoradd.preopt.indep.blocks.ll -loop-extract -S
# opt -loop-extract -S vectoradd.ll > vectoradd.loop.extract.ll

# echo "Extract function main_4 (loop) to module main_4.ll."
# ${PATH_TO_LLVM_BUILD}/bin/llvm-extract -func=main_7 vectoradd.preopt.indep.blocks.loop.extract.ll -S > main_7.ll

#echo "Remove o corpo da função"
#echo "define internal void @main_7(float*, float*, float*) #1 {} e deixa a declaração (extern)."
#echo "declare void @main_7(float*, float*, float*) #1"


echo "--> 3. Prepare the LLVM-IR for Polly"
opt -S -mem2reg -loop-simplify -polly-indvars vectoradd.ll > vectoradd.preopt.ll

# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -S -mem2reg -loop-simplify -polly-indvars vectoradd.ll > vectoradd.preopt.ll

echo "--> 4. Show the SCoPs detected by Polly"
opt -basicaa -polly-cloog -analyze -q vectoradd.preopt.ll

# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-cloog -analyze -q vectoradd.preopt.ll

echo "--> 5.1 Highlight the detected SCoPs in the CFGs of the program"
# We only create .dot files, as directly -view-scops directly calls graphviz
# which would require user interaction to continue the script.
# opt -basicaa -view-scops -disable-output vectoradd.preopt.ll
opt -basicaa -dot-scops -disable-output vectoradd.preopt.ll

# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-scops -disable-output vectoradd.preopt.ll

echo "--> 5.2 Highlight the detected SCoPs in the CFGs of the program (print \
no instructions)"
# We only create .dot files, as directly -view-scops-only directly calls
# graphviz which would require user interaction to continue the script.
# opt -basicaa -view-scops-only -disable-output vectoradd.preopt.ll
# opt -basicaa -view-scops -disable-output vectoradd.preopt.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -view-scops -disable-output vectoradd.preopt.ll
opt -basicaa -dot-scops-only -disable-output vectoradd.preopt.ll

opt -basicaa -dot-cfg -disable-output vectoradd.preopt.ll

echo "--> 5.3 Create .png files from the .dot files"
for i in `ls *.dot`; do dot -Tpng $i > $i.png; done

echo "--> 6. View the polyhedral representation of the SCoPs"
opt -basicaa -polly-scops -analyze vectoradd.preopt.ll

echo "--> 7. Show the dependences for the SCoPs"
opt -basicaa -polly-dependences -analyze vectoradd.preopt.ll

echo "Show the ScopInfo: (rag)"
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so  -basicaa -polly-prepare  -polly-analyze-ir  -analyze < vectoradd.preopt.ll
opt -basicaa -polly-prepare  -polly-analyze-ir -analyze vectoradd.preopt.ll

echo "Show the Dependences: value-based (rag)"
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-dependences -analyze -polly-dependences-analysis-type=value-based < vectoradd.preopt.ll
opt -basicaa -polly-dependences -analyze -polly-dependences-analysis-type=value-based vectoradd.preopt.ll

echo "Analise com AST."
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -polly-import-jscop-dir=/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm/tools/polly/test/Isl/Ast -basicaa -polly-import-jscop -polly-ast -polly-ast-detect-parallel -analyze < vectoradd.preopt.ll
opt -polly-import-jscop-dir=. -basicaa -polly-import-jscop -polly-ast -polly-ast-detect-parallel -analyze < vectoradd.preopt.ll

echo "Show the Dependences: memory-based (rag)"
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-dependences -analyze -polly-dependences-analysis-type=memory-based < vectoradd.preopt.ll
opt -basicaa -polly-dependences -analyze -polly-dependences-analysis-type=memory-based vectoradd.preopt.ll

echo "Moving figures to ./preopt"
mkdir preopt
mv *.dot ./preopt
mv *.png ./preopt

echo "Blocos independentes."
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-independent -S < vectoradd.preopt.ll > vectoradd.preopt.indep.blocks.ll
opt -basicaa -polly-independent -S vectoradd.preopt.ll > vectoradd.preopt.indep.blocks.ll

opt -basicaa -dot-scops-only -disable-output vectoradd.preopt.indep.blocks.ll
opt -basicaa -dot-scops -disable-output vectoradd.preopt.indep.blocks.ll

opt -basicaa -dot-cfg -disable-output vectoradd.preopt.indep.blocks.ll

echo "--> 5.3 Create .png files from the .dot files"
for i in `ls *.dot`; do dot -Tpng $i > $i.png; done

#/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so  -basicaa -view-scops -disable-output teste.ll

mkdir indep-blocks
mv *.dot ./indep-blocks
mv *.png ./indep-blocks

echo "Para callgraph ver o comando no script. "
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so  -basicaa -view-callgraph -disable-output vectoradd.preopt.ll







echo "--> 8. Export jscop files"
opt -basicaa -polly-export-jscop vectoradd.preopt.ll

echo "--> 9. Import the updated jscop files and print the new SCoPs. (optional)"
opt -basicaa -polly-import-jscop -polly-cloog -analyze vectoradd.preopt.ll
opt -basicaa -polly-import-jscop -polly-cloog -analyze vectoradd.preopt.ll \
    -polly-import-jscop-postfix=interchanged
opt -basicaa -polly-import-jscop -polly-cloog -analyze vectoradd.preopt.ll \
    -polly-import-jscop-postfix=interchanged+tiled
opt -basicaa -polly-import-jscop -polly-cloog -analyze vectoradd.preopt.ll \
    -polly-import-jscop-postfix=interchanged+tiled+vector

echo "--> 10. Codegenerate the SCoPs"
opt -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged \
    -polly-codegen \
    vectoradd.preopt.ll | opt -O3 > vectoradd.polly.interchanged.ll
opt -basicaa -polly-import-jscop \
    -polly-import-jscop-postfix=interchanged+tiled -polly-codegen \
    vectoradd.preopt.ll | opt -O3 > vectoradd.polly.interchanged+tiled.ll
opt -basicaa -polly-import-jscop \
    -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen \
    vectoradd.preopt.ll -polly-vectorizer=polly\
    | opt -O3 > vectoradd.polly.interchanged+tiled+vector.ll
opt -basicaa -polly-import-jscop \
    -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen \
    vectoradd.preopt.ll -polly-vectorizer=polly -enable-polly-openmp\
    | opt -O3 > vectoradd.polly.interchanged+tiled+vector+openmp.ll
opt vectoradd.preopt.ll | opt -O3 > vectoradd.normalopt.ll

echo "--> 11. Create the executables"
llc vectoradd.polly.interchanged.ll -o vectoradd.polly.interchanged.s && gcc vectoradd.polly.interchanged.s \
    -o vectoradd.polly.interchanged.exe
llc vectoradd.polly.interchanged+tiled.ll -o vectoradd.polly.interchanged+tiled.s && gcc vectoradd.polly.interchanged+tiled.s \
    -o vectoradd.polly.interchanged+tiled.exe
llc vectoradd.polly.interchanged+tiled+vector.ll \
    -o vectoradd.polly.interchanged+tiled+vector.s \
    && gcc vectoradd.polly.interchanged+tiled+vector.s \
    -o vectoradd.polly.interchanged+tiled+vector.exe
llc vectoradd.polly.interchanged+tiled+vector+openmp.ll \
    -o vectoradd.polly.interchanged+tiled+vector+openmp.s \
    && gcc -lgomp vectoradd.polly.interchanged+tiled+vector+openmp.s \
    -o vectoradd.polly.interchanged+tiled+vector+openmp.exe
llc vectoradd.normalopt.ll -o vectoradd.normalopt.s && gcc vectoradd.normalopt.s \
    -o vectoradd.normalopt.exe

echo "--> 12. Compare the runtime of the executables"

echo "time ./vectoradd.normalopt.exe"
time -f "%E real, %U user, %S sys" ./vectoradd.normalopt.exe
echo "time ./vectoradd.polly.interchanged.exe"
time -f "%E real, %U user, %S sys" ./vectoradd.polly.interchanged.exe
echo "time ./vectoradd.polly.interchanged+tiled.exe"
time -f "%E real, %U user, %S sys" ./vectoradd.polly.interchanged+tiled.exe
echo "time ./vectoradd.polly.interchanged+tiled+vector.exe"
time -f "%E real, %U user, %S sys" ./vectoradd.polly.interchanged+tiled+vector.exe
echo "time ./vectoradd.polly.interchanged+tiled+vector+openmp.exe"
time -f "%E real, %U user, %S sys" ./vectoradd.polly.interchanged+tiled+vector+openmp.exe
