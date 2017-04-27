; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.6.4-5) 4.6.4 LLVM: 3.3svn\22"

@.cst = linker_private constant [18 x i8] c"final result: %f\0A\00", align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture %argv) unnamed_addr #0 {
entry:
  %0 = tail call noalias i8* @malloc(i64 4096) #1
  %1 = tail call noalias i8* @malloc(i64 4096) #1
  %2 = tail call noalias i8* @malloc(i64 4096) #1
  br label %"3"

"3":                                              ; preds = %entry, %"3"
  %3 = phi i64 [ 0, %entry ], [ %10, %"3" ]
  %indvar113 = phi i64 [ 0, %entry ], [ %indvar.next12, %"3" ]
  %scevgep16 = getelementptr i8* %1, i64 %3
  %scevgep14 = getelementptr i8* %0, i64 %3
  %scevgep1617 = bitcast i8* %scevgep16 to float*
  %scevgep1415 = bitcast i8* %scevgep14 to float*
  %4 = trunc i64 %indvar113 to i32
  %5 = sitofp i32 %4 to float
  %6 = tail call float @sinf(float %5) #2
  %7 = fmul float %6, %6
  store float %7, float* %scevgep1415, align 4
  %8 = tail call float @cosf(float %5) #2
  %9 = fmul float %8, %8
  store float %9, float* %scevgep1617, align 4
  %indvar.next12 = add i64 %indvar113, 1
  %10 = shl i64 %indvar.next12, 2
  %exitcond13 = icmp eq i64 %indvar.next12, 1024
  br i1 %exitcond13, label %"6", label %"3"

"6":                                              ; preds = %"3", %"6"
  %11 = phi i64 [ %15, %"6" ], [ 0, %"3" ]
  %indvar22 = phi i64 [ %indvar.next3, %"6" ], [ 0, %"3" ]
  %scevgep9 = getelementptr i8* %1, i64 %11
  %scevgep7 = getelementptr i8* %0, i64 %11
  %scevgep5 = getelementptr i8* %2, i64 %11
  %scevgep910 = bitcast i8* %scevgep9 to float*
  %scevgep78 = bitcast i8* %scevgep7 to float*
  %scevgep56 = bitcast i8* %scevgep5 to float*
  %12 = load float* %scevgep78, align 4
  %13 = load float* %scevgep910, align 4
  %14 = fadd float %12, %13
  store float %14, float* %scevgep56, align 4
  %indvar.next3 = add i64 %indvar22, 1
  %15 = shl i64 %indvar.next3, 2
  %exitcond4 = icmp eq i64 %indvar.next3, 1024
  br i1 %exitcond4, label %"9", label %"6"

"9":                                              ; preds = %"6", %"9"
  %16 = phi float [ %19, %"9" ], [ 0.000000e+00, %"6" ]
  %indvar1 = phi i64 [ %indvar.next, %"9" ], [ 0, %"6" ]
  %17 = shl i64 %indvar1, 2
  %scevgep = getelementptr i8* %2, i64 %17
  %scevgep1 = bitcast i8* %scevgep to float*
  %18 = load float* %scevgep1, align 4
  %19 = fadd float %16, %18
  %indvar.next = add i64 %indvar1, 1
  %exitcond = icmp eq i64 %indvar.next, 1024
  br i1 %exitcond, label %"11", label %"9"

"11":                                             ; preds = %"9"
  %20 = fmul float %19, 9.765625e-04
  %21 = fpext float %20 to double
  %22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.cst, i64 0, i64 0), double %21) #1
  tail call void @free(i8* %0) #1
  tail call void @free(i8* %1) #1
  tail call void @free(i8* %2) #1
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readnone
declare float @sinf(float) #2

; Function Attrs: nounwind readnone
declare float @cosf(float) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture, ...) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone }
