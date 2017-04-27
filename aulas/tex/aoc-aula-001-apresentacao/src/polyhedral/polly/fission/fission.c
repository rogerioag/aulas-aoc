#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 5
#define M 5

int A[N];
int B[N][M];

int main() {
  int i, j;
  
  for (i = 0; i < N; i++) {
      A[i] = i;
      for(j = 0; j < M; j++){
	B[i][j] = i + j;
      }
  }

  return 0;
}
