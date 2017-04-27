#include <stdio.h>

#define MAX 1024

#ifdef FAST
#define F(x) ((x >> 8) & 0xF)
#else
#define F(x) ((x) & 0xF)
#endif

int vetor[MAX];

char ToHex(int n){
  switch (n){
    case 0: return '0';
    case 1: return '1';
    case 2: return '2';
    case 3: return '3';
    case 4: return '4';
    case 5: return '5';
    case 6: return '6';
    case 7: return '7';
    case 8: return '8';
    case 9: return '9';
    case 10: return 'A';
    case 11: return 'B';
    case 12: return 'C';
    case 13: return 'D';
    case 14: return 'E';
    case 15: return 'F';
  }
}

char main(){
  int i, j;
  char ch;

  for (i = 0; i < MAX; i++){
    vetor[i] = F(i);
    printf("vetor[%d]: %d", i, vetor[i]);
  }

  for (j = 0; j < 1000; j++){
    for (i = 0; i < MAX; i++){
      ch = ToHex(vetor[i]);
    }
  }

  return ch;
}
