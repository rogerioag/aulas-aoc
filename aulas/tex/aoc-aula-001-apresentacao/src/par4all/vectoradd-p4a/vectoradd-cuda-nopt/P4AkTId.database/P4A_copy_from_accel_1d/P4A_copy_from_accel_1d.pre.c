void P4A_copy_from_accel_1d(size_t element_size, size_t d1_size, size_t d1_block_size, size_t d1_offset, void *host_address, const void *accel_address)
{
   size_t i;
   char *cdest = d1_offset*element_size+(char *) host_address;
   const char *csrc = accel_address;
   for(i = 0; i < d1_block_size*element_size-1+1; i += 1)
      cdest[i] = csrc[i];
}
