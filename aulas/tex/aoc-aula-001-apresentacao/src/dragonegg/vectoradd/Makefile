all: compile compile-test

compile:
	gcc vectoradd.c -o vectoradd
compile-test:
	gcc vectoradd.c -DTEST -o vectoradd-test

run: compile
	./vectoradd

run-with-test: compile-test
	./vectoradd-test

clean:
	rm vectoradd vectoradd-test

