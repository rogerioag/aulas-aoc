
all: seq

seq:	sumvecs-seq.c
	gcc -std=c99 -o sumvecs-seq sumvecs-seq.c

gimple: sumvecs-seq.c
	gcc -std=c99 -fdump-tree-gimple -o sumvecs-seq sumvecs-seq.c


clean:
	rm sumvecs-seq

