
#define N 1024

float A[N][N];
float B[N][N];
float C[N][N];

int main() {
  int i, j, k;

  for(i=0; i<N; i++)  {
    for(j=0; j<N; j++)  {
      C[i][j] = 0;
      for(k=0; k<N; k++)
	C[i][j] = C[i][j] + A[i][k] * B[k][j];
    }
  } 
  
  return 0;
}
