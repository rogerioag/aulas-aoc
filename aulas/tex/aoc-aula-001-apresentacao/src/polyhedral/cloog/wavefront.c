/* DON'T FORGET TO USE -lm OPTION TO COMPILE. */

/* Useful headers. */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/* Parameter value. */
#define PARVAL1 5
#define PARVAL2 5
/* Useful macros. */
#define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
#define ceild(n,d)  (((n)<0) ? -((-(n))/(d)) : ((n)+(d)-1)/(d))
#define max(x,y)    ((x) > (y) ? (x) : (y))
#define min(x,y)    ((x) < (y) ? (x) : (y))

/* Statement macros (please set). */
#define S1(i,j) {total++; printf("S1 (%d, %d)\n",i,j);}

int main() {
  /* Scattering iterators. */
  int c1, c2;
  /* Original iterators. */
  int i, j;
  /* Parameters. */
  int n=PARVAL1, m=PARVAL2;
  int total=0;

  if ((m >= 1) && (n >= 1)) {
    for (i=1; i<=n-1; i++) {
      for (j=1; j<=m-1; j++) {
        S1(i,j);
      }
    }
  }
  printf("Number of integral points: %d.\n",total);
  return 0;
}
