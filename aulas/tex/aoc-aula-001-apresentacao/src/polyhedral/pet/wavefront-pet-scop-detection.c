void foo(int n, int m)
{
	int i, j;
	int A[n][m];

#pragma scop
for (i=1; i<=n-1; i++) {
  for (j=1; j<=m-1; j++) {
    A[i][j] = (A[i-1][j] + A[i][j-1] + A[i+1][j] + A[i][j+1])/4;
  }
}
#pragma endscop
}
