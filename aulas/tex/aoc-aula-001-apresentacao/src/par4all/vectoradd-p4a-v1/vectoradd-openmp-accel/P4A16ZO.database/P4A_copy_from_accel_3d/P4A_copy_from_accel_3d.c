# 2878
void P4A_copy_from_accel_3d(size_t element_size,
                            size_t d1_size, size_t d2_size, size_t d3_size,
                            size_t d1_block_size, size_t d2_block_size, size_t d3_block_size,
                            size_t d1_offset, size_t d2_offset, size_t d3_offset,
                            void *host_address,
                            const void *accel_address) { 
  size_t i, j, k; 
  char * cdest = d3_offset*element_size + (char*)host_address; 
  const char * csrc = (char*)accel_address; 
  for(i = 0;  i < d1_block_size;  i++)
    for(j = 0;  j < d2_block_size;  j++)
      for(k = 0;  k < d3_block_size*element_size;  k++)
        cdest[((i + d1_offset)*d2_block_size + j + d2_offset)*element_size*d3_size + k] =
            csrc[(i*d2_block_size + j)*d3_block_size*element_size + k]; 
}
