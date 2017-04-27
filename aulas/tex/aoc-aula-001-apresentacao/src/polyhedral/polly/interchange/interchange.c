#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 5
#define M 5

int A[N][M];

int main() {
  int i, j;
  int total = 0;
  
  for (i = 0; i < N; i++) {
    for (j = 0; j < M; j++) {
      A[i][j] = i + j;
    }
  }
   printf("Number of integral points: %d.\n",total);

  return 0;
}
