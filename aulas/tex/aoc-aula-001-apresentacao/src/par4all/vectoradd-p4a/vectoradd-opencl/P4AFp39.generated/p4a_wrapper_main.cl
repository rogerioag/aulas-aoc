/*
 * file for p4a_kernel_main.c
 */
//PIPS generated variable
P4A_accel_kernel p4a_kernel_main(int i, P4A_accel_global_address float  *a, P4A_accel_global_address float  *b,  int n);
//
//     This module was automatically generated by PIPS
//
;
//PIPS generated variable
P4A_accel_kernel_wrapper p4a_wrapper_main(int i, P4A_accel_global_address float  *a, P4A_accel_global_address float  *b,  int n);
P4A_accel_kernel_wrapper p4a_wrapper_main(int i, P4A_accel_global_address float  *a, P4A_accel_global_address float  *b,  int n)
{
   // Index has been replaced by P4A_vp_0:
   i = P4A_vp_0;
   p4a_kernel_main(i, a, b, n);
}
P4A_accel_kernel p4a_kernel_main(int i, P4A_accel_global_address float  *a, P4A_accel_global_address float  *b,  int n)
{
   if (i<=n-1) {
      *(a+i) = sin(i)*sin(i);
      *(b+i) = cosf(i)*cosf(i);
   }
}