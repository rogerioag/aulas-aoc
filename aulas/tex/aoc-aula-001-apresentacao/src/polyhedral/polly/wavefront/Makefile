all: compile-atax compile-sincos compile-vectoradd

compile-sincos:
	gfortran -c sincos.f90 -o sincos_f.o
	gcc -Dreal=float -std=c99 -c sincos.c -o sincos_main.o
	gfortran sincos_main.o sincos_f.o -o sincos.exe

compile-atax:
	gcc atax.c -o atax.exe

compile-vectoradd:
	gcc vectoradd.c -o vectoradd.exe

run-sincos: compile-sincos
	./sincos.exe 16 16 16

run-atax: compile-atax
	./atax.exe

clean:
	rm *.exe *.o

