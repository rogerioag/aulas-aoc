# 2950
void P4A_copy_to_accel_4d(size_t element_size,
        size_t d1_size, size_t d2_size, size_t d3_size, size_t d4_size,
        size_t d1_block_size, size_t d2_block_size, size_t d3_block_size, size_t d4_block_size,
        size_t d1_offset, size_t d2_offset, size_t d3_offset, size_t d4_offset,
        const void *host_address,
        void *accel_address) { 
  size_t i, j, k,l; 
  char * cdest = (char *)accel_address; 
  const char * csrc = (char *)host_address; 
  for(i = 0;  i < d1_block_size;  i++) { 
    for(j = 0;  j < d2_block_size;  j++) { 
      for(k = 0;  k < d3_block_size;  k++) { 
        for(l = 0;  l < d4_block_size;  l++) { 
          int h_index = (i+d1_offset)*d2_size*d3_size*d4_size
              + (j + d2_offset )*d3_size*d4_size
              + (k + d3_offset )*d4_size
              + (l + d4_offset); 
          int a_index = i*d2_block_size*d3_block_size*d4_block_size
              + j*d3_block_size*d4_block_size
              + k*d4_block_size
              + l; 
          cdest[a_index] = csrc[h_index]; 
        } 
      } 
    } 
  } 
}
