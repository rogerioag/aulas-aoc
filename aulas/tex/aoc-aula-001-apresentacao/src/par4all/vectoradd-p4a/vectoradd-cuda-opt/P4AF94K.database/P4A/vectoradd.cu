/* Use the Par4All accelerator run time: */
#include <p4a_accel.h>
/*
 * file for vectoradd.c
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[]);
//PIPS generated variable
void p4a_launcher_main(float *a, float *b, int n);
//PIPS generated variable
void p4a_launcher_main_1(float *a, float *b, float *c, int n);
//PIPS generated variable
P4A_accel_kernel p4a_kernel_main(int i, float *a, float *b, int n), p4a_kernel_main_1(int i, float *a, float *b, float *c, int n);
//PIPS generated variable
;
//PIPS generated variable
P4A_accel_kernel_wrapper p4a_wrapper_main(int i, float *a, float *b, int n), p4a_wrapper_main_1(int i, float *a, float *b, float *c, int n);
//PIPS generated variable
;
//PIPS generated variable
;
//PIPS generated variable
;
P4A_accel_kernel_wrapper p4a_wrapper_main_1(int i, float *a, float *b, float *c, int n)
{
   // Index has been replaced by P4A_vp_0:
   i = P4A_vp_0;
   p4a_kernel_main_1(i, a, b, c, n);
}
P4A_accel_kernel p4a_kernel_main_1(int i, float *a, float *b, float *c, int n)
{
   if (i<=n-1)
      c[i] = a[i]+b[i];
}
P4A_accel_kernel_wrapper p4a_wrapper_main(int i, float *a, float *b, int n)
{
   // Index has been replaced by P4A_vp_0:
   i = P4A_vp_0;
   p4a_kernel_main(i, a, b, n);
}
P4A_accel_kernel p4a_kernel_main(int i, float *a, float *b, int n)
{
   if (i<=n-1) {
      a[i] = sinf(i)*sinf(i);
      b[i] = cosf(i)*cosf(i);
   }
}
void p4a_launcher_main_1(float *a, float *b, float *c, int n)
{
   //PIPS generated variable
   int i;
   P4A_call_accel_kernel_1d(p4a_wrapper_main_1, n, (int) i, (float *) a, (float *) b, (float *) c, (int) n);
}
void p4a_launcher_main(float *a, float *b, int n)
{
   //PIPS generated variable
   int i;
   P4A_call_accel_kernel_1d(p4a_wrapper_main, n, (int) i, (float *) a, (float *) b, (int) n);
}
int main(int argc, char *argv[])
{
   P4A_init_accel;
   
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
