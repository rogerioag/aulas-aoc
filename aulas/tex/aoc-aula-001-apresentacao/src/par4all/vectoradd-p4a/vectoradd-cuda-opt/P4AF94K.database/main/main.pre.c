int main(int argc, char *argv[])
{
   // Prepend here P4A_init_accel
   
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
   a = (float *) malloc(bytes);
   b = (float *) malloc(bytes);
   c = (float *) malloc(bytes);
   
   // Initialize content of input vectors, vector a[i] = sin(i)^2 vector b[i] = cos(i)^2
   int i;
   p4a_launcher_main(a, b, n);
   p4a_launcher_main_1(a, b, c, n);
   
   // Sum up vector c and print result divided by n, this should equal 1 within error
   float sum = 0;
   for(i = 0; i <= n-1; i += 1)
      sum += c[i];
   sum = sum/n;
   printf("final result: %f\n", sum);
   
   // Release memory
   free(a);
   free(b);
   free(c);

   return 0;
}
