

# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen vectoradd.preopt.ll -polly-vectorizer=polly -enable-polly-openmp | /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so -O3 -S > vectoradd.polly.interchanged+tiled+vector+openmp.ll

# echo "Extracting loops to functions."
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/opt -load /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/lib/LLVMPolly.so vectoradd.preopt.indep.blocks.ll -loop-extract -S
# opt -loop-extract -S vectoradd.ll > vectoradd.loop.extract.ll

# echo "Extract function main_4 (loop) to module main_4.ll."
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/llvm-extract -func=main_7 vectoradd.preopt.indep.blocks.loop.extract.ll -S > main_7.ll
# ${PATH_TO_LLVM_BUILD}/bin/llvm-extract -func=main_7 vectoradd.preopt.indep.blocks.loop.extract.ll -S > main_7.ll

/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/llvm-extract -func=main_1 atax_preopt_prepare_indep_blocks_loop_extract.ll -S > main_1.ll

#echo "Remove o corpo da função"
#echo "define internal void @main_7(float*, float*, float*) #1 {} e deixa a declaração (extern)."
#echo "declare void @main_7(float*, float*, float*) #1"

# Linkagem das duas funções de novo.
llvm-link atax_preopt_prepare_indep_blocks_loop_extract.ll main_1.ll > teste.bc

lli teste.bc

# Gerar o Assembly nativo do modulo principal.
/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/clang atax_preopt_prepare_indep_blocks_loop_extract_without_main_1.ll -S -O3 -o atax_preopt_prepare_indep_blocks_loop_extract_without_main_1.s

/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/clang atax_preopt_prepare_indep_blocks_loop_extract_main_1.ll -S -O3 -o atax_preopt_prepare_indep_blocks_loop_extract_main_1.s

# Compilar com GCC.
gcc -c atax_preopt_prepare_indep_blocks_loop_extract_without_main_1.s -o atax_preopt_prepare_indep_blocks_loop_extract_without_main_1.o

# Neste ponto alterar o arquivo para chamar os kernels.
gcc -c atax_preopt_prepare_indep_blocks_loop_extract_main_1.s -o atax_preopt_prepare_indep_blocks_loop_extract_main_1.o

gcc atax_preopt_prepare_indep_blocks_loop_extract_main_1.o atax_preopt_prepare_indep_blocks_loop_extract_without_main_1.o -o atax.exe












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
