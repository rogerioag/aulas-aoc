; ModuleID = 'vectoradd-with-function.c.ir.s'
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
  %"alloca point" = bitcast i32 0 to i32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  br label %"4"

"3":                                              ; preds = %"4"
  %0 = load float** @c, align 8
  %1 = load float** @a, align 8
  %scevgep1 = getelementptr float* %1, i64 %indvar
  %2 = load float* %scevgep1, align 4
  %3 = load float** @b, align 8
  %scevgep2 = getelementptr float* %3, i64 %indvar
  %4 = load float* %scevgep2, align 4
  %5 = fadd float %2, %4
  %scevgep = getelementptr float* %0, i64 %indvar
  store float %5, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  br label %"4"

"4":                                              ; preds = %"3", %"2"
  %indvar = phi i64 [ %indvar.next, %"3" ], [ 0, %"2" ]
  %exitcond = icmp ne i64 %indvar, 1024
  br i1 %exitcond, label %"3", label %"5"

"5":                                              ; preds = %"4"
  br label %return

return:                                           ; preds = %"5"
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) unnamed_addr #0 {
entry:
  %"alloca point" = bitcast i32 0 to i32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %0 = call noalias i8* @malloc(i64 4096) #1
  %1 = bitcast i8* %0 to float*
  store float* %1, float** @a, align 8
  %2 = call noalias i8* @malloc(i64 4096) #1
  %3 = bitcast i8* %2 to float*
  store float* %3, float** @b, align 8
  %4 = call noalias i8* @malloc(i64 4096) #1
  %5 = bitcast i8* %4 to float*
  store float* %5, float** @c, align 8
  br label %"4"

"3":                                              ; preds = %"4"
  %6 = load float** @a, align 8
  %7 = sitofp i32 %18 to float
  %8 = call float @sinf(float %7) #2
  %9 = sitofp i32 %18 to float
  %10 = call float @sinf(float %9) #2
  %11 = fmul float %8, %10
  %scevgep4 = getelementptr float* %6, i64 %indvar1
  store float %11, float* %scevgep4, align 4
  %12 = load float** @b, align 8
  %13 = sitofp i32 %18 to float
  %14 = call float @cosf(float %13) #2
  %15 = sitofp i32 %18 to float
  %16 = call float @cosf(float %15) #2
  %17 = fmul float %14, %16
  %scevgep5 = getelementptr float* %12, i64 %indvar1
  store float %17, float* %scevgep5, align 4
  %indvar.next2 = add i64 %indvar1, 1
  br label %"4"

"4":                                              ; preds = %"3", %"2"
  %indvar1 = phi i64 [ %indvar.next2, %"3" ], [ 0, %"2" ]
  %18 = trunc i64 %indvar1 to i32
  %exitcond3 = icmp ne i64 %indvar1, 1024
  br i1 %exitcond3, label %"3", label %"5"

"5":                                              ; preds = %"4"
  call void (...)* @vectorAdd() #0
  br label %"7"

"6":                                              ; preds = %"7"
  %19 = load float** @c, align 8
  %scevgep = getelementptr float* %19, i64 %indvar
  %20 = load float* %scevgep, align 4
  %21 = fadd float %20, %22
  %indvar.next = add i64 %indvar, 1
  br label %"7"

"7":                                              ; preds = %"6", %"5"
  %indvar = phi i64 [ %indvar.next, %"6" ], [ 0, %"5" ]
  %22 = phi float [ %21, %"6" ], [ 0.000000e+00, %"5" ]
  %exitcond = icmp ne i64 %indvar, 1024
  br i1 %exitcond, label %"6", label %"8"

"8":                                              ; preds = %"7"
  %.lcssa = phi float [ %22, %"7" ]
  %23 = fdiv float %.lcssa, 1.024000e+03
  %24 = fpext float %23 to double
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.cst, i64 0, i64 0), double %24) #1
  %26 = load float** @a, align 8
  %27 = bitcast float* %26 to i8*
  call void @free(i8* %27) #1
  %28 = load float** @b, align 8
  %29 = bitcast float* %28 to i8*
  call void @free(i8* %29) #1
  %30 = load float** @c, align 8
  %31 = bitcast float* %30 to i8*
  call void @free(i8* %31) #1
  br label %return

return:                                           ; preds = %"8"
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readnone
declare float @sinf(float) #2

; Function Attrs: nounwind readnone
declare float @cosf(float) #2

declare i32 @printf(i8*, ...)

; Function Attrs: nounwind
declare void @free(i8*) #1

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone }
