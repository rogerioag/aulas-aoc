void * P4A_runtime_host_ptr_to_accel_ptr(void *host_ptr, size_t size)
{
   void *accel_ptr;
   malloc(size);
   P4A_accel_malloc(&accel_ptr, size);
   return accel_ptr;
}
