void P4A_copy_to_accel(size_t element_size, const void *host_address, void *accel_address)
{
   size_t i;
   char *cdest = accel_address;
   const char *csrc = host_address;
   for(i = 0; i < element_size; i += 1)
      cdest[i] = csrc[i];
}
