#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 6
#define M 6

int main( int argc, char *argv[] ){
 
    int i, j;
    // float *A;
    // size_t bytes = N * M * sizeof(float);
    // A = (float*)malloc(bytes);
    int A[N][M];
    
    #pragma scop 
    for(i=2; i<N; i++) {
        for(j=1; i<M; j++) {
            A[i][j] = i + j;       // S3
        }
    }  
    #pragma endscop
 
    // free(A);
    return 0;
}
