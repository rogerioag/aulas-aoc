; ModuleID = 'vectoradd.c'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.6.4-5) 4.6.4 LLVM: 3.3svn\22"

@.cst = linker_private constant [18 x i8] c"final result: %f\0A\00", align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) unnamed_addr #0 {
entry:
  %argc_addr = alloca i32, align 4
  %argv_addr = alloca i8**, align 8
  %n = alloca i32
  %a = alloca float*
  %b = alloca float*
  %c = alloca float*
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
  %2 = call noalias i8* @malloc(i64 4096) #1
  %3 = bitcast i8* %2 to float*
  %4 = call noalias i8* @malloc(i64 4096) #1
  %5 = bitcast i8* %4 to float*
  br label %"4"

"3":                                              ; preds = %"4"
  %6 = sext i32 %27 to i64
  %7 = mul i64 %6, 4
  %8 = bitcast float* %1 to i8*
  %9 = getelementptr i8* %8, i64 %7
  %10 = bitcast i8* %9 to float*
  %11 = sitofp i32 %27 to float
  %12 = call float @sinf(float %11) #2
  %13 = sitofp i32 %27 to float
  %14 = call float @sinf(float %13) #2
  %15 = fmul float %12, %14
  store float %15, float* %10, align 4
  %16 = sext i32 %27 to i64
  %17 = mul i64 %16, 4
  %18 = bitcast float* %3 to i8*
  %19 = getelementptr i8* %18, i64 %17
  %20 = bitcast i8* %19 to float*
  %21 = sitofp i32 %27 to float
  %22 = call float @cosf(float %21) #2
  %23 = sitofp i32 %27 to float
  %24 = call float @cosf(float %23) #2
  %25 = fmul float %22, %24
  store float %25, float* %20, align 4
  %26 = add i32 %27, 1
  br label %"4"

"4":                                              ; preds = %"3", %"2"
  %27 = phi i32 [ %26, %"3" ], [ 0, %"2" ]
  %28 = icmp slt i32 %27, 1024
  br i1 %28, label %"3", label %"5"

"5":                                              ; preds = %"4"
  br label %"7"

"6":                                              ; preds = %"7"
  %29 = sext i32 %48 to i64
  %30 = mul i64 %29, 4
  %31 = bitcast float* %5 to i8*
  %32 = getelementptr i8* %31, i64 %30
  %33 = bitcast i8* %32 to float*
  %34 = sext i32 %48 to i64
  %35 = mul i64 %34, 4
  %36 = bitcast float* %1 to i8*
  %37 = getelementptr i8* %36, i64 %35
  %38 = bitcast i8* %37 to float*
  %39 = load float* %38, align 4
  %40 = sext i32 %48 to i64
  %41 = mul i64 %40, 4
  %42 = bitcast float* %3 to i8*
  %43 = getelementptr i8* %42, i64 %41
  %44 = bitcast i8* %43 to float*
  %45 = load float* %44, align 4
  %46 = fadd float %39, %45
  store float %46, float* %33, align 4
  %47 = add i32 %48, 1
  br label %"7"

"7":                                              ; preds = %"6", %"5"
  %48 = phi i32 [ %47, %"6" ], [ 0, %"5" ]
  %49 = icmp slt i32 %48, 1024
  br i1 %49, label %"6", label %"8"

"8":                                              ; preds = %"7"
  br label %"10"

"9":                                              ; preds = %"10"
  %50 = sext i32 %58 to i64
  %51 = mul i64 %50, 4
  %52 = bitcast float* %5 to i8*
  %53 = getelementptr i8* %52, i64 %51
  %54 = bitcast i8* %53 to float*
  %55 = load float* %54, align 4
  %56 = fadd float %55, %59
  %57 = add i32 %58, 1
  br label %"10"

"10":                                             ; preds = %"9", %"8"
  %58 = phi i32 [ %57, %"9" ], [ 0, %"8" ]
  %59 = phi float [ %56, %"9" ], [ 0.000000e+00, %"8" ]
  %60 = icmp slt i32 %58, 1024
  br i1 %60, label %"9", label %"11"

"11":                                             ; preds = %"10"
  %61 = fdiv float %59, 1.024000e+03
  %62 = fpext float %61 to double
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.cst, i64 0, i64 0), double %62) #1
  %64 = bitcast float* %1 to i8*
  call void @free(i8* %64) #1
  %65 = bitcast float* %3 to i8*
  call void @free(i8* %65) #1
  %66 = bitcast float* %5 to i8*
  call void @free(i8* %66) #1
  store i32 0, i32* %"<retval>", align 1
  br label %return

return:                                           ; preds = %"11"
  %67 = load i32* %"<retval>", align 4
  ret i32 %67
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
