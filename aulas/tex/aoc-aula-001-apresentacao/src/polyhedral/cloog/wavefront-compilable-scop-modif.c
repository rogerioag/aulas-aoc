/* Generated from wavefront.cloog by CLooG 0.18.1-UNKNOWN gmp bits in 0.00s. */
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
#define S1(i,j) {total++; printf("S1 %d %d\n",i,j);}

int main() {
  /* Scattering iterators. */
  int c1, c2;
  /* Original iterators. */
  int i, j;
  /* Parameters. */
  int n=PARVAL1, m=PARVAL2;
  int total=0;

  if ((m >= 2) && (n >= 2)) {
    for (c1=2;c1<=n+m-2;c1++) {
      for (c2=max(1,c1-m+1);c2<=min(c1-1,n-1);c2++) {
        S1(c2,c1-c2);
      }
    }
  }

  printf("Number of integral points: %d.\n",total);
  return 0;
}
