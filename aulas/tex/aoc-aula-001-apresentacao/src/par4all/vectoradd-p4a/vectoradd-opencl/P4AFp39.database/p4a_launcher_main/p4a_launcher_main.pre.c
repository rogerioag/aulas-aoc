void p4a_launcher_main(float *a, float *b, int n)
{
   //Opencl wrapper declaration
   //PIPS generated variable
   int i;
   // Loop nest P4A begin,1D(n)
   for(i = 0; i <= n-1; i += 1)
      // Loop nest P4A end
      if (i<=n-1)
         p4a_wrapper_main(i, a, b, n);
}
