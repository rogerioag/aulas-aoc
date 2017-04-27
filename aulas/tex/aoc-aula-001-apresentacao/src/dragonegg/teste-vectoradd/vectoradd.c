#include <stdio.h>
#include <stdlib.h>
#include <math.h>
 
int main(){
 
    // Size of vectors
    int n = 100000;
 
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
        b[i] = 2*i;
    }
 
    // Sum component wise and save result into vector c
    for(i=0; i<n; i++){
        c[i] = a[i] + b[i];
    }
 
    // Sum up vector c and print result divided by n, this should equal 1 within error
    int sum = 0;
    for(i=0; i<n; i++) {
        sum += c[i];
    }
    sum = sum/n;
    printf("final result: %f\n", sum);
 
    // Release memory
    free(a);
    free(b);
    free(c);
 
    return 0;
}
