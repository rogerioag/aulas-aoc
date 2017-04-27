#include <omp.h>
#include <stdio.h>
#define SIZE 16

int main() {
   int A[SIZE], i;
		
   // inicia as threads que executarão o bloco "for" 
   #pragma omp parallel for schedule(static, 2) num_threads(4)
   for(i = 0; i < SIZE; i++){ 
     A[i] = i * i;  
     printf("Th%d[%d] = %d\n", omp_get_thread_num(), i, A[i]);
   }
}

