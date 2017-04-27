P4A_accel_kernel p4a_kernel_main_1(int i, float *a, float *b, float *c, int n)
{
   if (i<=n-1)
      *(c+i) = *(a+i)+*(b+i);
}
