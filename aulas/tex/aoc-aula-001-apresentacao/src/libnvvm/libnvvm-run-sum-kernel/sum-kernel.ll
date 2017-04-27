target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Intrinsic to read X component of thread ID
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() readnone nounwind
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() readnone nounwind
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() readnone nounwind

define void @sum_kernel(float* nocapture %a, float* nocapture %b, float* nocapture %c) uwtable {
entry:
	%0 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
	%1 = tail call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
	%2 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
	%3 = mul i32 %2, %1
	%4 = add i32 %3, %0
	%5 = sext i32 %4 to i64
	%6 = add i64 %5, 2147483648
	%7 = getelementptr float* %a, i64 %6
	%8 = load float* %7, align 4
	%9 = getelementptr float* %b, i64 %6
	%10 = load float* %9, align 4
	%11 = fadd float %8, %10
	%12 = getelementptr float* %c , i64 %6
	store float %11 , float* %12 , align 4
	ret void
}

!nvvm.annotations = !{!1}
!1 = metadata !{void (float*, float*, float*)* @sum_kernel, metadata !"kernel", i32 1}
