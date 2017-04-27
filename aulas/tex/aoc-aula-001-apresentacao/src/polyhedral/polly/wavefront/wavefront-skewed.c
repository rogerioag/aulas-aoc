#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 5
#define M 5

int A[N][M];

int main() {
  int c1, c2;
  int n = N;
  int m = M;
  
  if ((m >= 2) && (n >= 2)) {
  for (c1=2;c1<=n+m-2;c1++) {
    for (c2=max(1,c1-m+1);c2<=min(c1-1,n-1);c2++) {
      A[c2][c1-c2] = (A[c2-1][c1-c2] + A[c2][c1-c2-1] + A[c2+1][c1-c2] + A[c2][c1-c2+1])/4;  //S1'
    }
  }
}

  return 0;
}
