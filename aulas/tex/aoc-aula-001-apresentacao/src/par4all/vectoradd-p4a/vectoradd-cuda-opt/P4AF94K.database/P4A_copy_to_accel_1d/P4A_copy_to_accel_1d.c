# 2823
void P4A_copy_to_accel_1d(size_t element_size,
     size_t d1_size,
     size_t d1_block_size,
     size_t d1_offset,
     const void *host_address,
     void *accel_address) { 
  size_t i; 
  char * cdest = accel_address; 
  const char * csrc = d1_offset*element_size + (char *)host_address; 
  for(i = 0;  i < d1_block_size*element_size;  i++)
    cdest[i] = csrc[i]; 
}
