#!/bin/bash -xe

echo ' Início da execução de $0.'
if [ "$#" -ne 2 ]; then
  echo " Uso: $0 <benchmark>.ll loop_function_name" >&2
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
FUNC_NAME=$2

export LLVM_BASE="/dados/rogerio/USP/doutorado/prototipo-34-gpu"

export PATH_TO_LLVM_BUILD="${LLVM_BASE}/llvm_build"
export PATH_TO_POLLY_LIB="${PATH_TO_LLVM_BUILD}/lib"

export LD_LIBRARY_PATH="${PATH_TO_POLLY_LIB}:${LLVM_BASE}/cloog_install/lib:$LD_LIBRARY_PATH"

echo "--> 6.Extracting loop function to separate module.ll"
# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/llvm-extract -func=main_7 vectoradd.preopt.indep.blocks.loop.extract.ll -S > main_7.ll
# ${PATH_TO_LLVM_BUILD}/bin/llvm-extract -func=main_7 vectoradd.preopt.indep.blocks.loop.extract.ll -S > main_7.ll
${PATH_TO_LLVM_BUILD}/bin/llvm-extract -func=${FUNC_NAME} ${BENCHMARK}.ll -S > ${BENCHMARK}_${FUNC_NAME}.ll

# /dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/llvm-extract -func=main_1 atax_preopt_prepare_indep_blocks_loop_extract.ll -S > main_1.ll

#echo "Remove o corpo da função"
#echo "define internal void @main_7(float*, float*, float*) #1 {} e deixa a declaração (extern)."
#echo "declare void @main_7(float*, float*, float*) #1"

# cat atax_preopt_prepare_indep_blocks_loop_extract.ll | sed -n "/define internal void @main_1/,/attributes #0 = {/p" | head -n-1 | tail -n+1 > teste.txt
# cat ${BENCHMARK}.ll | sed -n "/define internal void @${FUNC_NAME}/,/attributes #0 = { nounwind }/p" > ${BENCHMARK}_${FUNC_NAME}_function.txt
cat ${BENCHMARK}.ll | sed -n "/define internal void @${FUNC_NAME}/,/attributes #0 = {/p" | head -n-1 | tail -n+1 > ${BENCHMARK}_${FUNC_NAME}_function.txt

cat ${BENCHMARK}_${FUNC_NAME}_function.txt | head -n 1 | sed 's/{//' > ${BENCHMARK}_${FUNC_NAME}_function_name.txt
cat ${BENCHMARK}_${FUNC_NAME}_function.txt | sed -n "/define internal void @${FUNC_NAME}/,/attributes #0 = {/p" | head -n-1 | tail -n+2 > ${BENCHMARK}_${FUNC_NAME}_function_body.txt

cat ${BENCHMARK}_${FUNC_NAME}_function_name.txt | sed 's/define internal/declare/' > ${BENCHMARK}_${FUNC_NAME}_new_function_name.txt

# cat teste1.txt | sed "s/$(cat teste3.txt)/$(cat teste2.txt)/g"

# A função no módulo original é "define internal void @main_7(float*, float*, float*) #1 {}"
# Quando extrai para um módulo, no módulo fica define hidden void @main_7(float*, float*, float*) #1 {}
# O novo nome que vai para o arquivo original deve ser "declare void @main_7(float*, float*, float*) #1"
# sed -i 's/hidden/internal/' ${BENCHMARK}_${FUNC_NAME}_function.txt

# Troca a função original pela declaração.
#cat ${BENCHMARK}.ll | sed 's/$(cat ${BENCHMARK}_${FUNC_NAME}_function.txt)/$(cat ${BENCHMARK}_${FUNC_NAME}_new_function_name.txt)/g' > ${BENCHMARK}_without_${FUNC_NAME}.ll
# Atualmente somente copia um arquivo para outro, a remoção ainda está manual.
cat ${BENCHMARK}.ll > ${BENCHMARK}_without_${FUNC_NAME}.ll

# cat atax_preopt_prepare_indep_blocks_loop_extract.ll | sed 's/$(cat atax_preopt_prepare_indep_blocks_loop_extract_main_1_function.txt)/$(cat atax_preopt_prepare_indep_blocks_loop_extract_main_1_new_function_name.txt)/g' > ${BENCHMARK}_without_${FUNC_NAME}.ll

# grep -n "`cat teste_search.txt`" teste_orig.txt | cut -d : -f 1

# padrao=`cat ${BENCHMARK}_${FUNC_NAME}_function.txt`

#linha_inicio=`grep -n "$($padrao)" ${BENCHMARK}.ll | cut -d : -f 1 | head -n 1`
#linha_fim=`grep -n "$($padrao)" ${BENCHMARK}.ll | cut -d : -f 1 | tail -n 1`

#echo "inicio: $linha_inicio"
# echo "fim: $linha_fim"

echo ' Fim da execução de $0.'
