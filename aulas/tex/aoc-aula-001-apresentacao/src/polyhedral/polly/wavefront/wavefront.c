#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 5
#define M 5

int A[N][M];

int main() {
  int i, j;
  int n = N;
  int m = M;

  for (i = 1; i <= n-1; i++) {
    for (j = 1; j <= m-1; j++) {
      A[i][j] = (A[i-1][j] + A[i][j-1] + A[i+1][j] + A[i][j+1])/4;
    }
  }

  return 0;
}
