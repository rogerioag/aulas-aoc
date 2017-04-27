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

void p4a_launcher_main_1(float *a, float *b, float *c, int n)
{
   //PIPS generated variable
   int i;
   P4A_call_accel_kernel_1d(p4a_wrapper_main_1, n, i, a, b, c, n);
   
   #define P4A_call_accel_kernel_1d(kernel, P4A_n_iter_0, ...)		\
  do {									\
    if(P4A_n_iter_0>0) { \
      P4A_skip_debug(2,P4A_dump_message("Calling 1D kernel \"" #kernel "\" of size %d\n",	\
                                      P4A_n_iter_0));					\
      P4A_create_1d_thread_descriptors(P4A_grid_descriptor,		\
                                       P4A_block_descriptor,		\
                                       P4A_n_iter_0);			\
      P4A_call_accel_kernel(kernel, P4A_grid_descriptor, P4A_block_descriptor, \
                            (__VA_ARGS__));				\
	  } \
  } while (0)
  
  Transforma:
  P4A_call_accel_kernel((pips_accel_1, 1, pips_accel_dimBlock_1),
                          (*accel_imagein_re, *accel_imagein_im));

    into:

    do { pips_accel_1<<<1, pips_accel_dimBlock_1>>> (*accel_imagein_re, *accel_imagein_im); toolTestExecMessage (cudaGetLastError(),"P4A CUDA kernel execution failed", "init.cu", 58); } while (0);
*/
#define P4A_call_accel_kernel(kernel, grid, blocks, parameters)			\
  do {									\
    P4A_skip_debug(3,P4A_dump_location());				\
    P4A_skip_debug(1,P4A_dump_message("Invoking kernel %s (%dx%dx%d ; %dx%dx%d) with args %s\n",	\
                                      #kernel,        \
                                      grid.x,grid.y,grid.z,        \
                                      blocks.x,blocks.y,blocks.z,        \
                                      #parameters));			\
		P4A_TIMING_accel_timer_start; \
    P4A_call_accel_kernel_context(kernel,grid,blocks) \
    P4A_call_accel_kernel_parameters parameters;			\
    toolTestExecMessage(cudaGetLastError(),"P4A CUDA kernel execution failed");			\
    P4A_TIMING_accel_timer_stop; \
    P4A_TIMING_display_elasped_time(kernel); \
  } while (0)
   
  #define P4A_call_accel_kernel_context(kernel, grid, blocks)	\
  kernel<<<grid,blocks>>> 
   
  #define P4A_call_accel_kernel_parameters(...)	\
  (__VA_ARGS__)
   
   
}

int main(int argc, char *argv[])
{
   P4A_init_accel;

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
   
   return 0;
}


main
-> p4a_launcher_main_1(*P4A_var_a1, *P4A_var_b1, *P4A_var_c0, n);
   p4a_launcher_main_1(float *a, float *b, float *c, int n)
   {
     int i;
     P4A_call_accel_kernel_1d(p4a_wrapper_main_1, n, i, a, b, c, n);
     #define 
     P4A_call_accel_kernel_1d(p4a_wrapper_main_1, n, ...) // __VA_ARGS__ <- i, a, b, c, n
     -> P4A_create_1d_thread_descriptors(P4A_grid_descriptor, P4A_block_descriptor, P4A_n_iter_0);
     -> P4A_call_accel_kernel(p4a_wrapper_main_1, P4A_grid_descriptor, P4A_block_descriptor, (__VA_ARGS__));
     
     Transforma:
     P4A_call_accel_kernel((p4a_wrapper_main_1, P4A_grid_descriptor, P4A_block_descriptor), (*accel_imagein_re, *accel_imagein_im));
     
     em:
     do { 
         p4a_wrapper_main_1<<<P4A_grid_descriptor, P4A_block_descriptor>>> (*accel_imagein_re, *accel_imagein_im); 
         toolTestExecMessage (cudaGetLastError(),"P4A CUDA kernel execution failed", "init.cu", 58);
        } while (0);

        p4a_wrapper_main_1
        -> 
        __global__ void p4a_wrapper_main_1(int i, float *a, float *b, float *c, int n)
        {
            i = (blockIdx.x*blockDim.x + threadIdx.x);
            p4a_kernel_main_1(i, a, b, c, n);
            ->
            __device__ void p4a_kernel_main_1(int i, float *a, float *b, float *c, int n)
            {
                if (i<=n-1)
                c[i] = a[i]+b[i];
            }
        }



