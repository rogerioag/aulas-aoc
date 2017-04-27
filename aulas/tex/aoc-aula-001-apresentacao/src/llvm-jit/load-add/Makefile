all: compile-add
	g++ -rdynamic load-add.cpp `/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/llvm-config --cxxflags` `/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/llvm-config --libs` `/dados/rogerio/USP/doutorado/prototipo-34-gpu/llvm_build/bin/llvm-config --ldflags` -o load-add

compile-add:
	clang-3.4 -S -emit-llvm -c add.cpp -o add.ll

clean:
	rm load-add
