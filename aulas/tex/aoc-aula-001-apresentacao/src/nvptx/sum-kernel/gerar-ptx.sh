#!/bin/bash -xe

export BASE=/home/rogerio/prototipo-33
export LLVM_BUILD=${BASE}/llvm_build

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${LLVM_BUILD}/lib

${LLVM_BUILD}/bin/llc -march=nvptx64 sum-kernel.ll -o sum-kernel.ptx

