void p4a_launcher_main(float *a, float *b, int n)
{
   //PIPS generated variable
   int i;
   // Loop nest P4A begin,1D(n)
   for(i = 0; i <= n-1; i += 1)
      // Loop nest P4A end
      if (i<=n-1) {
         a[i] = sinf(i)*sinf(i);
         b[i] = cosf(i)*cosf(i);
      }
   ;
}
