float h_a[N];
float h_b[N];
float h_c[N];

int main() {
  int i;
  /* Inicializacao  dos vetores. */
  init_array();

  /* Calculo. */
  for (i = 0; i < N; i++) {
    h_c[i] = h_a[i] + h_b[i];
  }

  /* Resultados. */
  print_array();
  check_result();

  return 0;
}
