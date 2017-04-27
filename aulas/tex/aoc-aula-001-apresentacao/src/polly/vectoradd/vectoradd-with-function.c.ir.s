; ModuleID = 'vectoradd-with-function.c'
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
  %i = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  br label %"4"

"3":                                              ; preds = %"4"
  %0 = load float** @c, align 8
  %1 = sext i32 %22 to i64
  %2 = mul i64 %1, 4
  %3 = bitcast float* %0 to i8*
  %4 = getelementptr i8* %3, i64 %2
  %5 = bitcast i8* %4 to float*
  %6 = load float** @a, align 8
  %7 = sext i32 %22 to i64
  %8 = mul i64 %7, 4
  %9 = bitcast float* %6 to i8*
  %10 = getelementptr i8* %9, i64 %8
  %11 = bitcast i8* %10 to float*
  %12 = load float* %11, align 4
  %13 = load float** @b, align 8
  %14 = sext i32 %22 to i64
  %15 = mul i64 %14, 4
  %16 = bitcast float* %13 to i8*
  %17 = getelementptr i8* %16, i64 %15
  %18 = bitcast i8* %17 to float*
  %19 = load float* %18, align 4
  %20 = fadd float %12, %19
  store float %20, float* %5, align 4
  %21 = add i32 %22, 1
  br label %"4"

"4":                                              ; preds = %"3", %"2"
  %22 = phi i32 [ %21, %"3" ], [ 0, %"2" ]
  %23 = icmp sle i32 %22, 1023
  br i1 %23, label %"3", label %"5"

"5":                                              ; preds = %"4"
  br label %return

return:                                           ; preds = %"5"
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) unnamed_addr #0 {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %bytes = alloca i64
  %i = alloca i32
  %sum = alloca float
  %"<retval>" = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 %argc, i32* %argc_addr, align 1
  store i8** %argv, i8*** %argv_addr, align 1
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
  %7 = sext i32 %29 to i64
  %8 = mul i64 %7, 4
  %9 = bitcast float* %6 to i8*
  %10 = getelementptr i8* %9, i64 %8
  %11 = bitcast i8* %10 to float*
  %12 = sitofp i32 %29 to float
  %13 = call float @sinf(float %12) #2
  %14 = sitofp i32 %29 to float
  %15 = call float @sinf(float %14) #2
  %16 = fmul float %13, %15
  store float %16, float* %11, align 4
  %17 = load float** @b, align 8
  %18 = sext i32 %29 to i64
  %19 = mul i64 %18, 4
  %20 = bitcast float* %17 to i8*
  %21 = getelementptr i8* %20, i64 %19
  %22 = bitcast i8* %21 to float*
  %23 = sitofp i32 %29 to float
  %24 = call float @cosf(float %23) #2
  %25 = sitofp i32 %29 to float
  %26 = call float @cosf(float %25) #2
  %27 = fmul float %24, %26
  store float %27, float* %22, align 4
  %28 = add i32 %29, 1
  br label %"4"

"4":                                              ; preds = %"3", %"2"
  %29 = phi i32 [ %28, %"3" ], [ 0, %"2" ]
  %30 = icmp sle i32 %29, 1023
  br i1 %30, label %"3", label %"5"

"5":                                              ; preds = %"4"
  call void (...)* @vectorAdd() #0
  br label %"7"

"6":                                              ; preds = %"7"
  %31 = load float** @c, align 8
  %32 = sext i32 %40 to i64
  %33 = mul i64 %32, 4
  %34 = bitcast float* %31 to i8*
  %35 = getelementptr i8* %34, i64 %33
  %36 = bitcast i8* %35 to float*
  %37 = load float* %36, align 4
  %38 = fadd float %37, %41
  %39 = add i32 %40, 1
  br label %"7"

"7":                                              ; preds = %"6", %"5"
  %40 = phi i32 [ %39, %"6" ], [ 0, %"5" ]
  %41 = phi float [ %38, %"6" ], [ 0.000000e+00, %"5" ]
  %42 = icmp sle i32 %40, 1023
  br i1 %42, label %"6", label %"8"

"8":                                              ; preds = %"7"
  %43 = fdiv float %41, 1.024000e+03
  %44 = fpext float %43 to double
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.cst, i64 0, i64 0), double %44) #1
  %46 = load float** @a, align 8
  %47 = bitcast float* %46 to i8*
  call void @free(i8* %47) #1
  %48 = load float** @b, align 8
  %49 = bitcast float* %48 to i8*
  call void @free(i8* %49) #1
  %50 = load float** @c, align 8
  %51 = bitcast float* %50 to i8*
  call void @free(i8* %51) #1
  store i32 0, i32* %"<retval>", align 1
  br label %return

return:                                           ; preds = %"8"
  %52 = load i32* %"<retval>", align 4
  ret i32 %52
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
