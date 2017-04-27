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
