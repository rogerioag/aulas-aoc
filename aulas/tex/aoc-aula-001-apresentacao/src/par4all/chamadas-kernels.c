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
   P4A_call_accel_kernel_1d(p4a_wrapper_main_1, n, i, a, b, c, n);
}

void p4a_launcher_main(float *a, float *b, int n)
{
   //PIPS generated variable
   int i;
   P4A_call_accel_kernel_1d(p4a_wrapper_main, n, i, a, b, n);
}

int main(int argc, char *argv[])
{
   P4A_init_accel;
   
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
   
   return 0;
}
