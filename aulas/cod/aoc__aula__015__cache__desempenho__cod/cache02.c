#define MAX 10000
unsigned int matriz[MAX][MAX];

int main(){
  int i, j;
  for (i = 0; i < MAX; i ++)
    for (j = 0; j < MAX; j ++)
      matriz[j][i] = i + j;
  
  return 0;
}
