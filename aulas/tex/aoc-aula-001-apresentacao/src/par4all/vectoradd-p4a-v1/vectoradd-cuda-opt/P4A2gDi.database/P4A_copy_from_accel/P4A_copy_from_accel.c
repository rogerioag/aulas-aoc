# 2727
void P4A_copy_from_accel(size_t element_size,
    void *host_address,
    const void *accel_address) { 
  size_t i; 
  char * cdest = host_address; 
  const char * csrc = accel_address; 
  for(i = 0;  i < element_size;  i++)
    cdest[i] = csrc[i]; 
}
