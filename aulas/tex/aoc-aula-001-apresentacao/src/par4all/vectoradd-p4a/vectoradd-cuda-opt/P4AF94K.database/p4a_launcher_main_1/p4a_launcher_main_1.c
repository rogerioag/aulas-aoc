void p4a_launcher_main_1(float *a, float *b, float *c, int n)
{
   //PIPS generated variable
   int i;
   // Loop nest P4A begin,1D(n)
   for(i = 0; i <= n-1; i += 1)
      // Loop nest P4A end
      if (i<=n-1)
         c[i] = a[i]+b[i];
   ;
}
