#define MAX 512
unsigned int matriz[MAX][MAX];

int main(){
  int i, j;
  for (j = 0; i < MAX; i ++)
    for (i = 0; j < MAX; j ++)
      matriz[i][j] = i + j;
  
  return 0;
}
