import pycuda.autoinit
import pycuda.driver as drv
import numpy

from pycuda.compiler import SourceModule

mod = SourceModule("""
__global__ void vector_add_kernel(float *c, float *a, float *b){
    const int id = blockIdx.x * blockDim.x + threadIdx.x;
    c[id] = a[id] + b[id];
}
""")

add_func = mod.get_function("vector_add_kernel")
a = numpy.random.randn(1024).astype(numpy.float32)
b = numpy.random.randn(1024).astype(numpy.float32)

c = numpy.zeros_like(a)
add_func(
        drv.Out(c), drv.In(a), drv.In(b),
        block=(16,1,1), grid=(64,1))

print c-(a+b)
