#!/bin/bash

echo "Emiting the GCC assembly." 
# gcc hello.c -S -O1 -o hello-gcc.s
gcc hello.c -S -O0 -o hello-gcc.s

echo "Emiting the GCC assembly optimized by LLVM." 
# gcc hello.c -S -O1 -fplugin=./dragonegg.so -o hello-gcc-opt-llvm.s 
gcc hello.c -S -O0 -fplugin=../../../../../../../rogerio/USP/doutorado/dragonegg/dragonegg/dragonegg.so -o hello-gcc-opt-llvm.s


echo "Emiting the LLVM IR: gcc-O1-llvm-O0" 
# gcc hello.c -S -O1 -fplugin=./dragonegg.so -fplugin-arg-dragonegg-emit-ir -o hello-ir.s 
gcc hello.c -S -O1 -fplugin=../../../../../../../rogerio/USP/doutorado/dragonegg//dragonegg/dragonegg.so -fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=0 -o hello-ir-gcc-O1-llvm-O0.s

echo "Emiting the LLVM IR: gcc-O1-llvm-O1" 
gcc hello.c -S -O1 -fplugin=../../../../../../../rogerio/USP/doutorado/dragonegg//dragonegg/dragonegg.so -fplugin-arg-dragonegg-emit-ir -fplugin-arg-dragonegg-llvm-ir-optimize=1 -o hello-ir-gcc-O1-llvm-O1.s
