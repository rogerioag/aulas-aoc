#!/bin/bash

export GCC=/usr/bin/gcc-4.7

echo "Emiting the GCC assembly." 
${GCC} vectoradd.c -S -O0 -o vectoradd-gcc.s

echo "Emiting the GCC assembly optimized by LLVM." 
# gcc vectoradd.c -S -O1 -fplugin=./dragonegg.so -o vectoradd-gcc-opt-llvm.s 
${GCC} vectoradd.c -S -O0 -fplugin=../../../../../../../rogerio/USP/doutorado/dragonegg/dragonegg/dragonegg.so -o vectoradd-gcc-opt-llvm.s


echo "Emiting the LLVM IR." 
# gcc vectoradd.c -S -O1 -fplugin=./dragonegg.so -fplugin-arg-dragonegg-emit-ir -o vectoradd-ir.s 
${GCC} vectoradd.c -S -O0 -fplugin=../../../../../../../rogerio/USP/doutorado/dragonegg/dragonegg/dragonegg.so -fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=0 -o vectoradd-ir.s
