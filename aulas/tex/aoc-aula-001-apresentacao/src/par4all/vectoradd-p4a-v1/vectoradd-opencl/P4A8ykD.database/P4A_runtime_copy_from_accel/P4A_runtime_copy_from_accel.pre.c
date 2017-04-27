void P4A_runtime_copy_from_accel(void *host_ptr, size_t size)
{
   P4A_copy_from_accel(size, host_ptr, (void *) 0);
}
