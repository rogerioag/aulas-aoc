 export LLVM_BUILD=/dados/rogerio/USP/doutorado/llvm_build
 
 $LLVM_BUILD/bin/clang -S -emit-llvm teste-001.c -o teste-001.s
 
 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -S -mem2reg -loop-simplify -polly-indvars teste-001.s > teste-001.preopt.ll
 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -basicaa -polly-cloog -analyze -q teste-001.preopt.ll
 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -basicaa -view-scops-only -disable-output teste-001.preopt.ll
 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -basicaa -polly-scops -analyze teste-001.preopt.ll
 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -basicaa -polly-dependences -analyze teste-001.preopt.ll
 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -basicaa -polly-export-jscop teste-001.preopt.ll
 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so teste-001.preopt.ll -basicaa -polly-import-jscop -polly-cloog -analyze 
 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so teste-001.preopt.ll -basicaa -polly-import-jscop     -polly-import-jscop-postfix=interchanged -polly-cloog -analyze
 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so teste-001.preopt.ll -basicaa -polly-import-jscop     -polly-import-jscop-postfix=interchanged+tiled -polly-cloog -analyze

 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so teste-001.preopt.ll -basicaa -polly-import-jscop     -polly-import-jscop-postfix=interchanged+tiled+vector -polly-cloog -analyze
        
 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so teste-001.preopt.ll | $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -O3 > teste-001.normalopt.ll
    
 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -basicaa  -polly-import-jscop -polly-import-jscop-postfix=interchanged -polly-codegen teste-001.preopt.ll | $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -O3 > teste-001.polly.interchanged.ll

 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged+tiled -polly-codegen teste-001.preopt.ll | $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -O3 > teste-001.polly.interchanged+tiled.ll

 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen -polly-vectorizer=polly teste-001.preopt.ll | $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -O3 > teste-001.polly.interchanged+tiled+vector.ll
       
 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen -polly-vectorizer=polly -enable-polly-openmp teste-001.preopt.ll | $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -O3 > teste-001.polly.interchanged+tiled+openmp.ll

 $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -basicaa -polly-import-jscop -polly-import-jscop-postfix=interchanged+tiled+vector -polly-codegen -polly-vectorizer=polly -enable-polly-openmp teste-001.preopt.ll | $LLVM_BUILD/bin/opt -load $LLVM_BUILD/lib/LLVMPolly.so -O3 > teste-001.polly.interchanged+tiled+vector+openmp.ll
    
    $LLVM_BUILD/bin/llc teste-001.normalopt.ll -o teste-001.normalopt.s && gcc teste-001.normalopt.s -o teste-001.normalopt.exe ../utilities/polybench.o
    $LLVM_BUILD/bin/llc teste-001.polly.interchanged.ll -o teste-001.polly.interchanged.s && gcc teste-001.polly.interchanged.s -o teste-001.polly.interchanged.exe ../utilities/polybench.o
    $LLVM_BUILD/bin/llc teste-001.polly.interchanged+tiled.ll -o teste-001.polly.interchanged+tiled.s && gcc teste-001.polly.interchanged+tiled.s -o teste-001.polly.interchanged+tiled.exe ../utilities/polybench.o
    $LLVM_BUILD/bin/llc teste-001.polly.interchanged+tiled+vector.ll -o teste-001.polly.interchanged+tiled+vector.s && gcc teste-001.polly.interchanged+tiled+vector.s -o teste-001.polly.interchanged+tiled+vector.exe ../utilities/polybench.o
    $LLVM_BUILD/bin/llc teste-001.polly.interchanged+tiled+vector+openmp.ll -o teste-001.polly.interchanged+tiled+vector+openmp.s && gcc -lgomp teste-001.polly.interchanged+tiled+vector+openmp.s -o teste-001.polly.interchanged+tiled+vector+openmp.exe ../utilities/polybench.o
        
Vectorizing:
$LLVM_BUILD/bin/clang -Xclang -load -Xclang $LLVM_BUILD/lib/LLVMPolly.so -O3 -mllvm -polly -mllvm -polly-vectorizer=polly file.c

$LLVM_BUILD/bin/clang -Xclang -load -Xclang $LLVM_BUILD/lib/LLVMPolly.so -O3 -mllvm -polly -mllvm -polly-vectorizer=polly teste-001.c ../utilities/polybench.o -I../utilities/ -o teste-001-vector





