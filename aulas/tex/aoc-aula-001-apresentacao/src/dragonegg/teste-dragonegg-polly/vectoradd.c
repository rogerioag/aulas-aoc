#include <stdlib.h>
#include <stdio.h>
 
int main(){
 
    // Size of vectors
    int n = 512;
 
    // Input vectors
    int *a;
    int *b;
    // Output vector
    int *c;
 
    // Size, in bytes, of each vector
    size_t bytes = n*sizeof(int);
 
    // Allocate memory for each vector
    a = (int*)malloc(bytes);
    b = (int*)malloc(bytes);
    c = (int*)malloc(bytes);
 
    // Initialize content of input vectors, vector a[i] = sin(i)^2 vector b[i] = cos(i)^2
    int i;
    for(i=0; i<n; i++) {
        a[i] = i;
        b[i] = i;
    }
 
    // Sum component wise and save result into vector c
    for(i=0; i<n; i++){
        c[i] = a[i] + b[i];
    }
    printf("C[0]: %d C[511]: %d\n", c[0], c[511]);
 
    // Release memory
    free(a);
    free(b);
    free(c);
 
    return 0;
}
