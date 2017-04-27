# 5486
int main( int argc, char *argv[] ){ 

    // Size of vectors
    int n = 100000; 

    // Input vectors
    float *a; 
    float *b; 
    // Output vector
    float *c; 

    // Size, in bytes, of each vector
    size_t bytes = n*sizeof(float); 

    // Allocate memory for each vector
    a = (float*)malloc(bytes); 
    b = (float*)malloc(bytes); 
    c = (float*)malloc(bytes); 

    // Initialize content of input vectors, vector a[i] = sin(i)^2 vector b[i] = cos(i)^2
    int i; 
    for(i=0;  i<n;  i++) { 
        a[i] = sinf(i)*sinf(i); 
        b[i] = cosf(i)*cosf(i); 
    } 

    // Sum component wise and save result into vector c
    for(i=0;  i<n;  i++){ 
        c[i] = a[i] + b[i]; 
    } 

    // Sum up vector c and print result divided by n, this should equal 1 within error
    float sum = 0; 
    for(i=0;  i<n;  i++) { 
        sum += c[i]; 
    } 
    sum = sum/n; 
    printf("final result: %f\n" , sum); 

    // Release memory
    free(a); 
    free(b); 
    free(c); 

    return 0; 
}
