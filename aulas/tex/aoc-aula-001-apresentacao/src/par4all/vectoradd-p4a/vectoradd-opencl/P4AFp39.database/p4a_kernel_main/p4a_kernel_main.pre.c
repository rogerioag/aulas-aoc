P4A_accel_kernel p4a_kernel_main(int i, float *a, float *b, int n)
{
   if (i<=n-1) {
      *(a+i) = sinf(i)*sinf(i);
      *(b+i) = cosf(i)*cosf(i);
   }
}
