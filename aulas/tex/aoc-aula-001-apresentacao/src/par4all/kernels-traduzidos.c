__device__ void p4a_kernel_main_1(int i, float *a, float *b, float *c, int n)
{
   if (i<=n-1)
   c[i] = a[i]+b[i];
}


__global__ void p4a_wrapper_main_1(int i, float *a, float *b, float *c, int n)
{
   i = (blockIdx.x*blockDim.x + threadIdx.x);
   p4a_kernel_main_1(i, a, b, c, n);
            
}
