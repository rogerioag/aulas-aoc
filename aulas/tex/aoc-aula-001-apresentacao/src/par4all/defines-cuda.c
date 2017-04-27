/** A declaration attribute of a hardware-accelerated kernel in CUDA
    called from the GPU it-self
*/
#define P4A_accel_kernel __device__ void

/** A declaration attribute of a hardware-accelerated kernel called from
    the host in CUDA */
#define P4A_accel_kernel_wrapper __global__ void


/** Get the coordinate of the virtual processor in X (first) dimension in
    CUDA, corresponding to deepest loop to be memory friendly
*/
#define P4A_vp_0 (blockIdx.x*blockDim.x + threadIdx.x)

/** Get the coordinate of the virtual processor in Y (second) dimension in
    CUDA, corresponding to outermost loop
*/
#define P4A_vp_1 (blockIdx.y*blockDim.y + threadIdx.y)

/** Get the coordinate of the virtual processor in Z (second) dimension in
    CUDA
*/
#define P4A_vp_2 (blockIdx.z*blockDim.z + threadIdx.z)


#define P4A_call_accel_kernel_1d(kernel, P4A_n_iter_0, ...)		\
  do {									\
    if(P4A_n_iter_0>0) { \
      P4A_skip_debug(2,P4A_dump_message("Calling 1D kernel \"" #kernel "\" of size %d\n",	\
                                      P4A_n_iter_0));					\
      P4A_create_1d_thread_descriptors(P4A_grid_descriptor,		\
                                       P4A_block_descriptor,		\
                                       P4A_n_iter_0);			\
      P4A_call_accel_kernel(kernel, P4A_grid_descriptor, P4A_block_descriptor, \
                            (__VA_ARGS__));				\
	  } \
  } while (0)


/** Call a CUDA kernel on the accelerator.

    An API for full call control. For simpler usage: @see
    P4A_call_accel_kernel_1d, @see P4A_call_accel_kernel_2d, @see
    P4A_call_accel_kernel_3d

    This transforms for example:

    P4A_call_accel_kernel((pips_accel_1, 1, pips_accel_dimBlock_1),
                          (*accel_imagein_re, *accel_imagein_im));

    into:

    do { pips_accel_1<<<1, pips_accel_dimBlock_1>>> (*accel_imagein_re, *accel_imagein_im); toolTestExecMessage (cudaGetLastError(),"P4A CUDA kernel execution failed", "init.cu", 58); } while (0);
*/
#define P4A_call_accel_kernel(kernel, grid, blocks, parameters)			\
  do {									\
    P4A_skip_debug(3,P4A_dump_location());				\
    P4A_skip_debug(1,P4A_dump_message("Invoking kernel %s (%dx%dx%d ; %dx%dx%d) with args %s\n",	\
                                      #kernel,        \
                                      grid.x,grid.y,grid.z,        \
                                      blocks.x,blocks.y,blocks.z,        \
                                      #parameters));			\
		P4A_TIMING_accel_timer_start; \
    P4A_call_accel_kernel_context(kernel,grid,blocks) \
    P4A_call_accel_kernel_parameters parameters;			\
    toolTestExecMessage(cudaGetLastError(),"P4A CUDA kernel execution failed");			\
    P4A_TIMING_accel_timer_stop; \
    P4A_TIMING_display_elasped_time(kernel); \
  } while (0)
