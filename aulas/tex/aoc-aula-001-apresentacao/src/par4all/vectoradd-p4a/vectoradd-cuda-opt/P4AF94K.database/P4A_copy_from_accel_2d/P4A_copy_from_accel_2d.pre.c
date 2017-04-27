void P4A_copy_from_accel_2d(size_t element_size, size_t d1_size, size_t d2_size, size_t d1_block_size, size_t d2_block_size, size_t d1_offset, size_t d2_offset, void *host_address, const void *accel_address)
{
   size_t i, j;
   char *cdest = d2_offset*element_size+(char *) host_address;
   char *csrc = (char *) accel_address;
   for(i = 0; i < d1_block_size; i += 1)
      for(j = 0; j < d2_block_size*element_size-1+1; j += 1)
         cdest[(i+d1_offset)*element_size*d2_size+j] = csrc[i*element_size*d2_block_size+j];
}
