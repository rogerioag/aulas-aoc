; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.6.4-5) 4.6.4 LLVM: 3.3svn\22"

@c = common unnamed_addr global float* null
@b = common unnamed_addr global float* null
@a = common unnamed_addr global float* null
@.cst = linker_private constant [18 x i8] c"final result: %f\0A\00", align 8

; Function Attrs: nounwind uwtable
define void @vectorAdd(...) #0 {
entry:
  br label %"3"

"3":                                              ; preds = %entry, %"3"
  %indvar1 = phi i64 [ 0, %entry ], [ %indvar.next, %"3" ]
  %0 = load float** @c, align 8
  %1 = load float** @a, align 8
  %scevgep1 = getelementptr float* %1, i64 %indvar1
  %2 = load float* %scevgep1, align 4
  %3 = load float** @b, align 8
  %scevgep2 = getelementptr float* %3, i64 %indvar1
  %4 = load float* %scevgep2, align 4
  %5 = fadd float %2, %4
  %scevgep = getelementptr float* %0, i64 %indvar1
  store float %5, float* %scevgep, align 4
  %indvar.next = add i64 %indvar1, 1
  %exitcond = icmp eq i64 %indvar.next, 1024
  br i1 %exitcond, label %return, label %"3"

return:                                           ; preds = %"3"
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture %argv) unnamed_addr #0 {
entry:
  %0 = tail call noalias i8* @malloc(i64 4096) #1
  %1 = bitcast i8* %0 to float*
  store float* %1, float** @a, align 8
  %2 = tail call noalias i8* @malloc(i64 4096) #1
  %3 = bitcast i8* %2 to float*
  store float* %3, float** @b, align 8
  %4 = tail call noalias i8* @malloc(i64 4096) #1
  %5 = bitcast i8* %4 to float*
  store float* %5, float** @c, align 8
  br label %"3"

"3":                                              ; preds = %"3.3_crit_edge", %entry
  %6 = phi float* [ %1, %entry ], [ %.pre, %"3.3_crit_edge" ]
  %indvar13 = phi i64 [ 0, %entry ], [ %indvar.next2, %"3.3_crit_edge" ]
  %7 = trunc i64 %indvar13 to i32
  %8 = sitofp i32 %7 to float
  %9 = tail call float @sinf(float %8) #2
  %10 = fmul float %9, %9
  %scevgep4 = getelementptr float* %6, i64 %indvar13
  store float %10, float* %scevgep4, align 4
  %11 = load float** @b, align 8
  %12 = tail call float @cosf(float %8) #2
  %13 = fmul float %12, %12
  %scevgep5 = getelementptr float* %11, i64 %indvar13
  store float %13, float* %scevgep5, align 4
  %indvar.next2 = add i64 %indvar13, 1
  %exitcond3 = icmp eq i64 %indvar.next2, 1024
  br i1 %exitcond3, label %"5", label %"3.3_crit_edge"

"3.3_crit_edge":                                  ; preds = %"3"
  %.pre = load float** @a, align 8
  br label %"3"

"5":                                              ; preds = %"3"
  tail call void (...)* @vectorAdd() #0
  %14 = load float** @c, align 8
  br label %"6"

"6":                                              ; preds = %"5", %"6"
  %15 = phi float [ 0.000000e+00, %"5" ], [ %17, %"6" ]
  %indvar2 = phi i64 [ 0, %"5" ], [ %indvar.next, %"6" ]
  %scevgep = getelementptr float* %14, i64 %indvar2
  %16 = load float* %scevgep, align 4
  %17 = fadd float %15, %16
  %indvar.next = add i64 %indvar2, 1
  %exitcond = icmp eq i64 %indvar.next, 1024
  br i1 %exitcond, label %"8", label %"6"

"8":                                              ; preds = %"6"
  %18 = fmul float %17, 9.765625e-04
  %19 = fpext float %18 to double
  %20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.cst, i64 0, i64 0), double %19) #1
  %21 = load float** @a, align 8
  %22 = bitcast float* %21 to i8*
  tail call void @free(i8* %22) #1
  %23 = load float** @b, align 8
  %24 = bitcast float* %23 to i8*
  tail call void @free(i8* %24) #1
  %25 = load float** @c, align 8
  %26 = bitcast float* %25 to i8*
  tail call void @free(i8* %26) #1
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
