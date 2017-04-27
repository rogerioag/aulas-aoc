float A[NX][NY];
float x[NY];
float y[NY];
float tmp[NX];

void init_array() {
}

void print_array(){
}

void atax_function(){
  int i, j;
  
  for (i = 0; i < NY; i++) {
    y[i] = 0;
  }
  
  for (i = 0; i < NX; i++) {
    tmp[i] = 0;
    
    for (j = 0; j < NY; j++) {
      tmp[i] = tmp[i] + A[i][j] * x[j];
    }
    
    for (j = 0; j < NY; j++) {
      y[j] = y[j] + A[i][j] * tmp[i];
    }
  }
}

int main(int argc, char **argv) {
  init_array();
  
  atax_function();
  
  print_array(argc, argv);
  return 0;
}
