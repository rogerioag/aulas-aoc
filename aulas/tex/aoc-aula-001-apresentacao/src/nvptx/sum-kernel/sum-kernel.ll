target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Intrinsic to read X component of thread ID
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() readnone nounwind
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() readnone nounwind
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() readnone nounwind


define ptx_kernel void @sum_kernel(float addrspace(1)* %a, float addrspace(1)* %b, float addrspace(1)* %c) uwtable {
entry:
	;id = blockDim.x * blockIdx.x + threadIdx.x;
	%0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
	%1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
	%2 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
	%3 = mul i32 %2, %1
	%4 = add i32 %3, %0
	%5 = sext i32 %4 to i64
	%6 = add i64 %5, 0
	%7 = getelementptr float addrspace(1)* %a, i64 %6
	%9 = getelementptr float addrspace(1)* %b, i64 %6
	%12 = getelementptr float addrspace(1)* %c , i64 %6
	%8 = load float addrspace(1)* %7, align 4
	%10 = load float addrspace(1)* %9, align 4
	%11 = fadd float %8, %10
	store float %11 , float addrspace(1)* %12 , align 4
	ret void
}

!nvvm.annotations = !{!0}
!0 = metadata !{void (float addrspace(1)*,
                      float addrspace(1)*,
                      float addrspace(1)*)* @sum_kernel, metadata !"sum_kernel", i32 1}
