void P4A_copy_to_accel_3d(size_t element_size, size_t d1_size, size_t d2_size, size_t d3_size, size_t d1_block_size, size_t d2_block_size, size_t d3_block_size, size_t d1_offset, size_t d2_offset, size_t d3_offset, const void *host_address, void *accel_address)
{
   size_t i, j, k;
   char *cdest = (char *) accel_address;
   const char *csrc = d3_offset*element_size+(char *) host_address;
   for(i = 0; i < d1_block_size; i += 1)
      for(j = 0; j < d2_block_size; j += 1)
         for(k = 0; k < d3_block_size*element_size-1+1; k += 1)
            cdest[(i*d2_block_size+j)*d3_block_size*element_size+k] = csrc[((i+d1_offset)*d2_block_size+j+d2_offset)*element_size*d3_size+k];
}
