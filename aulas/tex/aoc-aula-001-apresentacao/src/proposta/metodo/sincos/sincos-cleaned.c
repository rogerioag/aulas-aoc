float x[NX * NY * NZ];
float y[NX * NY * NZ];
float xy[NX * NY * NZ];

void sincos_function_(int* nx, int* ny, int* nz, float* x, float* y, float* xy);

int main(int argc, char* argv[]){
  init_arrays();
  
  sincos_function_(&nx, &ny, &nz, x, y, xy);
  
  int sizeXy = (nx * ny * nz);
  
  float sum = getSum(xy, sizeXy);
  float min = getMin(xy, sizeXy);
  float max = getMax(xy, sizeXy);
  
  printf("%f %f %f\n", sum, min, max);
  
  return 0;
}
