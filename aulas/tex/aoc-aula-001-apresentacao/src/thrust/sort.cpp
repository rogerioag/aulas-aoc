#include <thrust/host_vector.h> 
#include <thrust/device_vector.h> 
#include <thrust/generate.h> 
#include <thrust/sort.h> 
#include <thrust/copy.h> 
#include <algorithm> 
#include <cstdlib>  

int main(void) {   
  // gera 32M numeros aleatorios sequencialmente   
  thrust::host_vector<int> h_vec(32 << 20);   
  std::generate(h_vec.begin(), h_vec.end(), rand);    

  // transfere os dados para a GPU
  thrust::device_vector<int> d_vec = h_vec;    

  // ordena os dados na GPU (846M chaves/s numa GeForce GTX 480)        
  thrust::sort(d_vec.begin(), d_vec.end());    

  // transfere os dados de volta ao host   
  thrust::copy(d_vec.begin(), d_vec.end(), h_vec.begin());    

  return 0;
}

