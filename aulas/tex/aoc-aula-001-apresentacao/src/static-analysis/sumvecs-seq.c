#include <stdio.h>
#include <stdlib.h>

void inicializar(float* arranjo, unsigned long long tamanho);
void imprimir(float* arranjo, unsigned long long tamanho);

int main(int argc, char** argv) {
	float* A;
	float* B;
	float* C;
	unsigned long long i;
	unsigned long long N = atof(argv[1]);

	A = (float*) malloc(N * sizeof(float));
	B = (float*) malloc(N * sizeof(float));
	C = (float*) malloc(N * sizeof(float));
    
	inicializar(A, N);
	inicializar(B, N);
	
	for (i = 0; i < N; ++i) {
  	C[i] = A[i] + B[i];
	}
    
	printf("\nA: ");
	imprimir(A, N);
	printf("\nB: ");
	imprimir(B, N);
	printf("\nC: ");
	imprimir(C, N);
	
	free(A);
	free(B);
	free(C);
	return 0;
}

void inicializar(float* arranjo, unsigned long long tamanho) {
	for (unsigned long long i = 0; i < tamanho; ++i)
		arranjo[i] = rand() / (float)RAND_MAX;
}

void imprimir(float* arranjo, unsigned long long tamanho){
	for (unsigned long long i = 0; i < tamanho; ++i)
		printf("%f ",arranjo[i]);
}

