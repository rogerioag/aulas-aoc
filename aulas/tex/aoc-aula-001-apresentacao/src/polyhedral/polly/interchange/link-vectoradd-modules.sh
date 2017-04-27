#!/bin/bash -xe

# Gerar o Assembly nativo do modulo principal.
/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/clang vectoradd_preopt_prepare_indep_blocks_loop_extract_without_main_vector.body.ll -S -O3 -o vectoradd_preopt_prepare_indep_blocks_loop_extract_without_main_vector.body.s

/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/clang vectoradd_preopt_prepare_indep_blocks_loop_extract_main_vector.body.ll -S -O3 -o vectoradd_preopt_prepare_indep_blocks_loop_extract_main_vector.body.s

# Compilar com GCC.
gcc -c vectoradd_preopt_prepare_indep_blocks_loop_extract_without_main_vector.body.s -o vectoradd_preopt_prepare_indep_blocks_loop_extract_without_main_vector.body.o

# Neste ponto alterar o arquivo para chamar os kernels.
gcc -c vectoradd_preopt_prepare_indep_blocks_loop_extract_main_vector.body.s -o vectoradd_preopt_prepare_indep_blocks_loop_extract_main_vector.body.o

gcc vectoradd_preopt_prepare_indep_blocks_loop_extract_main_vector.body.o vectoradd_preopt_prepare_indep_blocks_loop_extract_without_main_vector.body.o -o vectoradd.exe
