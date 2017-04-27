#include <stdio.h>
#include <stdlib.h>
/* Codigo suprimido. */
/* Default problem size. */
// Size of vectors.
#ifndef N
#define N 1024
#endif
// Entrada e saida.
float h_a[N];
float h_b[N];
float h_c[N];

void init_array() {
  fprintf(stdout, "Initialize vectors on host:\n");
	int i;
	// Initialize vectors on host.
	for (i = 0; i < N; i++) {
		h_a[i] = 0.5;
		h_b[i] = 0.5;
	}
}

void print_array() {
  int i;
  fprintf(stdout, "Printing the vector result:\n");
	for (i = 0; i < N; i++) {
		fprintf(stdout, "h_c[%d]: %f\n", i, h_c[i]);
	}
}

void check_result(){
  int i;
  float sum = 0;
  for (i = 0; i < N; i++) {
	sum += h_c[i];
  }
  fprintf(stdout, "Final Result: (%f, %f)\n", sum, (float)(sum / (float)N));
}
/* Codigo suprimido. */

int main() {
    int i;
    /* Initialization of vectors. */
    init_array();

    /* Computation. */
    for (i = 0; i < N; i++) {
      h_c[i] = h_a[i] + h_b[i];
    }

    /* Results. */
    print_array();
    check_result();

    return 0;
}
