# !/bin/bash

source /usr/local/par4all/etc/par4all-rc.sh

PROGDIR=`pwd`

PROGNAME=`basename $PROGDIR`

rm ../*.zip

# CUDA sem Optimizacao.
make clean
echo "RAG: Gerando CUDA sem otimizacao... > p4a-saida-nopt.txt"
echo "RAG: p4a -v -k --cuda $PROGNAME.c -o $PROGNAME-cuda" >> p4a-saida-cuda-nopt.txt
p4a -v -k --cuda $PROGNAME.c -o $PROGNAME-cuda 2>> p4a-saida-cuda-nopt.txt
echo "RAG: Executando $PROGNAME-cuda " >> p4a-saida-cuda-nopt.txt
echo "Diretorio: `pwd`"
./$PROGNAME-cuda >> p4a-saida-cuda-nopt.txt
cd ..
echo "RAG: Compactando diretorio $PROGNAME " >> $PROGNAME/p4a-saida-cuda-nopt.txt
# zip -rv $PROGNAME * >> $PROGNAME/p4a-saida-cuda-nopt.txt

zip -rv $PROGNAME-cuda-nopt.zip $PROGNAME >> $PROGNAME/p4a-saida-cuda-nopt.txt

# mv $PROGNAME.zip $PROGNAME-cuda-nopt.zip

# CUDA com Optimizacao.
cd $PROGDIR
make clean
echo "RAG: Gerando CUDA com otimizacao..." > p4a-saida-cuda-opt.txt
echo "RAG: p4a -v -k --cuda --com-optimization $PROGNAME.c -o $PROGNAME-cuda-opt" >> p4a-saida-cuda-opt.txt
p4a -v -k --cuda --com-optimization $PROGNAME.c -o $PROGNAME-cuda-opt 2>> p4a-saida-cuda-opt.txt
echo "RAG: Executando $PROGNAME-cuda-opt " >> p4a-saida-cuda-opt.txt
./$PROGNAME-cuda-opt >> p4a-saida-cuda-opt.txt
cd ..
echo "RAG: Compactando diretorio $PROGNAME" >> $PROGNAME/p4a-saida-cuda-opt.txt
#zip -r $PROGNAME * >> $PROGNAME/p4a-saida-cuda-opt.txt
#mv $PROGNAME.zip $PROGNAME-cuda-opt.zip
zip -rv $PROGNAME-cuda-opt.zip $PROGNAME >> $PROGNAME/p4a-saida-cuda-opt.txt

# OpenMP.
cd $PROGDIR
make clean
echo "RAG: Gerando OpenMP..." > p4a-saida-openmp.txt
echo "RAG: p4a -v -k --openmp --c-flags=\"-lm\" --cpp-flags=\"-lm\" --cxx-flags=\"-lm\" --ld-flags=\"-lm\" $PROGNAME.c -o $PROGNAME-openmp" >> p4a-saida-openmp.txt
p4a -v -k --openmp --c-flags="-lm" --cpp-flags="-lm" --cxx-flags="-lm" --ld-flags="-lm" $PROGNAME.c -o $PROGNAME-openmp 2>> p4a-saida-openmp.txt
echo "RAG: Executando $PROGNAME-openmp " >> p4a-saida-openmp.txt
./$PROGNAME-openmp >> p4a-saida-openmp.txt
cd ..
echo "RAG: Compactando diretorio $PROGNAME" >> $PROGNAME/p4a-saida-openmp.txt
# zip -r $PROGNAME * >> $PROGNAME/p4a-saida-openmp.txt
# mv $PROGNAME.zip $PROGNAME-openmp.zip
zip -rv $PROGNAME-openmp.zip $PROGNAME >> $PROGNAME/p4a-saida-openmp.txt

# OpenMP como accel.
cd $PROGDIR
make clean
echo "RAG: Gerando OpenMP como accel..." > p4a-saida-openmp-accel.txt
echo "RAG: p4a -v -k --accel --openmp --c-flags=\"-lm\" --cpp-flags=\"-lm\" --cxx-flags=\"-lm\" --ld-flags=\"-lm\" $PROGNAME.c -o $PROGNAME-openmp-accel" >> p4a-saida-openmp-accel.txt
p4a -v -k --accel --openmp --c-flags="-lm" --cpp-flags="-lm" --cxx-flags="-lm" --ld-flags="-lm" $PROGNAME.c -o $PROGNAME-openmp-accel 2>> p4a-saida-openmp-accel.txt
echo "RAG: Executando $PROGNAME-openmp-accel " >> p4a-saida-openmp-accel.txt
./$PROGNAME-openmp-accel >> p4a-saida-openmp-accel.txt
cd ..
echo "RAG: Compactando diretorio $PROGNAME" >> $PROGNAME/p4a-saida-openmp-accel.txt
#zip -r $PROGNAME * >> $PROGNAME/p4a-saida-openmp-accel.txt
#mv $PROGNAME.zip $PROGNAME-openmp-accel.zip
zip -rv $PROGNAME-openmp-accel.zip $PROGNAME >> $PROGNAME/p4a-saida-openmp-accel.txt

# OpenCL.
cd $PROGDIR
make clean
echo "RAG: Gerando OpenCL..." > p4a-saida-opencl.txt
echo "RAG: p4a -v -k --opencl --c-flags=\"-lm\" --cpp-flags=\"-lm\" --cxx-flags=\"-lm\" --ld-flags=\"-lm\" $PROGNAME.c -o $PROGNAME-opencl" >> p4a-saida-opencl.txt
p4a -v -k --opencl --c-flags="-lm" --cpp-flags="-lm" --cxx-flags="-lm" --ld-flags="-lm" $PROGNAME.c -o $PROGNAME-opencl 2>> p4a-saida-opencl.txt
echo "RAG: Executando $PROGNAME-opencl " >> p4a-saida-opencl.txt
./$PROGNAME-opencl >> p4a-saida-opencl.txt
cd ..
echo "RAG: Compactando diretorio $PROGNAME" >> $PROGNAME/p4a-saida-opencl.txt
#zip -r $PROGNAME * >> $PROGNAME/p4a-saida-opencl.txt
#mv $PROGNAME.zip $PROGNAME-opencl.zip
zip -rv $PROGNAME-opencl.zip $PROGNAME >> $PROGNAME/p4a-saida-opencl.txt

