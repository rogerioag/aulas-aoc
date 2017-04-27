/* Use the Par4All accelerator run time: */
#include <p4a_accel.h>
P4A_wrapper_proto(p4a_wrapper_main_1, i, a, b, c, n);
P4A_wrapper_proto(p4a_wrapper_main, i, a, b, n);
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
//PIPS generated variable;
//PIPS generated variable;
//PIPS generated variable;
//PIPS generated variable;
//PIPS generated variable
void P4A_accel_malloc(void **address, size_t size);
//PIPS generated variable
void P4A_copy_from_accel_1d(size_t element_size, size_t d1_size, size_t d1_block_size, size_t d1_offset, void *host_address, const void *accel_address);
//PIPS generated variable
void P4A_accel_free(void *address);
//PIPS generated variable
void P4A_copy_to_accel_1d(size_t element_size, size_t d1_size, size_t d1_block_size, size_t d1_offset, const void *host_address, void *accel_address);
void p4a_launcher_main_1(float *a, float *b, float *c, int n)
{
   //Opencl wrapper declaration
   //PIPS generated variable
   int i;
   P4A_call_accel_kernel_1d(p4a_wrapper_main_1, n, i, a, b, c, n);
}
void p4a_launcher_main(float *a, float *b, int n)
{
   //Opencl wrapper declaration
   //PIPS generated variable
   int i;
   P4A_call_accel_kernel_1d(p4a_wrapper_main, n, i, a, b, n);
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
   {
      //PIPS generated variable
      float (*P4A_var_b0)[100000] = (float (*)[100000]) 0, (*P4A_var_a0)[100000] = (float (*)[100000]) 0;
      P4A_accel_malloc((void **) &P4A_var_a0, sizeof(float)*100000);
      P4A_accel_malloc((void **) &P4A_var_b0, sizeof(float)*100000);

      p4a_launcher_main(*P4A_var_a0, *P4A_var_b0, n);
      P4A_copy_from_accel_1d(sizeof(float), 100000, 100000, 0, a, *P4A_var_a0);
      P4A_copy_from_accel_1d(sizeof(float), 100000, 100000, 0, b, *P4A_var_b0);
      P4A_accel_free(P4A_var_a0);
      P4A_accel_free(P4A_var_b0);
   }
   {
      //PIPS generated variable
      float (*P4A_var_c0)[100000] = (float (*)[100000]) 0, (*P4A_var_b1)[100000] = (float (*)[100000]) 0, (*P4A_var_a1)[100000] = (float (*)[100000]) 0;
      P4A_accel_malloc((void **) &P4A_var_a1, sizeof(float)*100000);
      P4A_accel_malloc((void **) &P4A_var_b1, sizeof(float)*100000);
      P4A_accel_malloc((void **) &P4A_var_c0, sizeof(float)*100000);
      P4A_copy_to_accel_1d(sizeof(float), 100000, 100000, 0, a, *P4A_var_a1);
      P4A_copy_to_accel_1d(sizeof(float), 100000, 100000, 0, b, *P4A_var_b1);

      p4a_launcher_main_1(*P4A_var_a1, *P4A_var_b1, *P4A_var_c0, n);
      P4A_copy_from_accel_1d(sizeof(float), 100000, 100000, 0, c, *P4A_var_c0);
      P4A_accel_free(P4A_var_a1);
      P4A_accel_free(P4A_var_b1);
      P4A_accel_free(P4A_var_c0);
   }
   
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