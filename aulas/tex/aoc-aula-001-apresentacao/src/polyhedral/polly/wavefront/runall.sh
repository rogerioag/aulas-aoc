#!/bin/sh -a

export PATH_TO_LLVM_BUILD="/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/"


echo "--> 1. Create LLVM-IR from atax_function using clang."
${PATH_TO_LLVM_BUILD}/bin/clang -O3 -S -emit-llvm atax.c -o atax.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/clang -O3 -S -emit-llvm atax.c -o atax.ll

echo "--> 1. Create LLVM-IR from sincos.c and sincos.f90 using gfortran + dragonegg."
gfortran-4.8 -S -O3 -fplugin=/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/dragonegg.so -fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=3 -fverbose-asm sincos.f90 -o sincos_function.ll

gcc-4.8 -Dreal=float -std=c99 -S -O0 -fplugin=/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/dragonegg.so -fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=0 -fverbose-asm sincos.c -o sincos.ll

echo "--> 1. Create LLVM-IR from vectoradd_function.c using gcc + dragonegg."
gcc-4.8 -S -O3 -fplugin=/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/dragonegg.so -fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=3 -fverbose-asm vectoradd.c -o vectoradd.ll

echo "--> 2. Load Polly automatically when calling the 'opt' tool"
export PATH_TO_POLLY_LIB="/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/"

alias opt="${PATH_TO_LLVM_BUILD}/bin/opt -load ${PATH_TO_POLLY_LIB}/LLVMPolly.so"

echo "--> 2. Prepare the LLVM-IR for Polly"
opt -S -mem2reg -loop-simplify -polly-indvars sincos_function.ll > sincos_function_preopt.ll

-polly-prepare -S -polly-codegen-scev


# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -S -mem2reg -loop-simplify -polly-indvars sincos_function.ll > sincos_function_preopt.ll

opt -S -mem2reg -loop-simplify -polly-indvars vectoradd.ll > vectoradd_preopt.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -S -mem2reg -loop-simplify -polly-indvars vectoradd.ll > vectoradd_preopt.ll

opt -S -mem2reg -loop-simplify -polly-indvars atax.ll > atax_preopt.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -S -mem2reg -loop-simplify -polly-indvars atax.ll > atax_preopt.ll

echo "--> 3a. Show the SCoPs detected by Polly"
opt -basicaa -polly-cloog -analyze -q atax_preopt.ll > fase-3/atax_preopt_cloog.txt
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-cloog -analyze -q atax_preopt.ll > fase-3/atax_preopt_cloog.txt

opt -basicaa -polly-cloog -analyze -q sincos_function_preopt.ll > fase-3/sincos_function_preopt_cloog.txt
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-cloog -analyze -q sincos_function_preopt.ll > fase-3/sincos_function_preopt_cloog.txt

opt -basicaa -polly-cloog -analyze -q vectoradd_preopt.ll > fase-3/vectoradd_preopt_cloog.txt
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-cloog -analyze -q vectoradd_preopt.ll > fase-3/vectoradd_preopt_cloog.txt

echo "--> 3b. Show the dependences for the SCoPs"
opt -basicaa -polly-dependences -analyze sincos_function_preopt.ll > fase-3/sincos_function_preopt_polly_deps.txt
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-dependences -analyze sincos_function_preopt.ll > fase-3/sincos_function_preopt_polly_deps.txt

opt -basicaa -polly-dependences -analyze atax_preopt.ll > fase-3/atax_preopt_polly_deps.txt
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-dependences -analyze atax_preopt.ll > fase-3/atax_preopt_polly_deps.txt

opt -basicaa -polly-dependences -analyze vectoradd_preopt.ll > fase-3/vectoradd_preopt_polly_deps.txt
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-dependences -analyze vectoradd_preopt.ll > fase-3/vectoradd_preopt_polly_deps.txt

echo "--> 5.1 Highlight the detected SCoPs in the CFGs of the program"
# We only create .dot files, as directly -view-scops directly calls graphviz
# which would require user interaction to continue the script.
# opt -basicaa -view-scops -disable-output vectoradd.preopt.ll
opt -basicaa -dot-scops -disable-output sincos_function_preopt.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-scops -disable-output sincos_function_preopt.ll

opt -basicaa -dot-scops -disable-output atax_preopt.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-scops -disable-output atax_preopt.ll

opt -basicaa -dot-scops -disable-output vectoradd_preopt.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-scops -disable-output vectoradd_preopt.ll

echo "3c. Blocos independentes para sincos_function_preopt.ll"
# SINCOS
opt -basicaa -polly-independent -S sincos_function_preopt.ll > sincos_function_preopt_indep_blocks.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-independent -S sincos_function_preopt.ll > sincos_function_preopt_indep_blocks.ll

opt -basicaa -dot-scops-only -disable-output sincos_function_preopt_indep_blocks.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-scops-only -disable-output sincos_function_preopt_indep_blocks.ll

opt -basicaa -dot-scops -disable-output sincos_function_preopt_indep_blocks.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-scops -disable-output sincos_function_preopt_indep_blocks.ll

opt -basicaa -dot-cfg -disable-output sincos_function_preopt_indep_blocks.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-cfg -disable-output sincos_function_preopt_indep_blocks.ll

echo "--> 5.3 Create .png files from the .dot files"
for i in `ls *.dot`; do dot -Tpng $i > $i.png; done

echo "Moving figures to fase-3/sincos_function"
mkdir -p fase-3/dot/sincos_function
mkdir -p fase-3/png/sincos_function

mv *.dot fase-3/dot/sincos_function
mv *.png fase-3/png/sincos_function

echo "3c. Blocos independentes para atax_preopt.ll."
## ATAX
opt -basicaa -polly-independent -S atax_preopt.ll > atax_preopt_indep_blocks.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-independent -S atax_preopt.ll > atax_preopt_indep_blocks.ll

opt -basicaa -dot-scops-only -disable-output sincos.preopt.indep.blocks.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-scops-only -disable-output atax_preopt_indep_blocks.ll

opt -basicaa -dot-scops -disable-output atax_preopt_indep_blocks.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-scops -disable-output atax_preopt_indep_blocks.ll

opt -basicaa -dot-cfg -disable-output atax_preopt_indep_blocks.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-cfg -disable-output atax_preopt_indep_blocks.ll

echo "--> 5.3 Create .png files from the .dot files"
for i in `ls *.dot`; do dot -Tpng $i > $i.png; done

echo "Moving figures to fase-3/sincos_function"
mkdir -p fase-3/dot/atax
mkdir -p fase-3/png/atax

mv *.dot fase-3/dot/atax
mv *.png fase-3/png/atax

echo "3c. Blocos independentes para vectoradd_preopt.ll."
## VECTORADD
opt -basicaa -polly-independent -S vectoradd_preopt.ll > vectoradd_preopt_indep_blocks.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-independent -S vectoradd_preopt.ll > vectoradd_preopt_indep_blocks.ll

opt -basicaa -dot-scops-only -disable-output sincos.preopt.indep.blocks.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-scops-only -disable-output vectoradd_preopt_indep_blocks.ll

opt -basicaa -dot-scops -disable-output vectoradd_preopt_indep_blocks.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-scops -disable-output vectoradd_preopt_indep_blocks.ll

opt -basicaa -dot-cfg -disable-output vectoradd_preopt_indep_blocks.ll
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -dot-cfg -disable-output vectoradd_preopt_indep_blocks.ll

echo "--> 5.3 Create .png files from the .dot files"
for i in `ls *.dot`; do dot -Tpng $i > $i.png; done

echo "Moving figures to fase-3/sincos_function"
mkdir -p fase-3/dot/vectoradd
mkdir -p fase-3/png/vectoradd

mv *.dot fase-3/dot/vectoradd
mv *.png fase-3/png/vectoradd




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
