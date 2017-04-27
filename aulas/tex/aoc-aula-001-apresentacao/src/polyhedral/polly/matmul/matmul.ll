; ModuleID = 'matmul.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@C = common global [1024 x [1024 x float]] zeroinitializer, align 16
@A = common global [1024 x [1024 x float]] zeroinitializer, align 16
@B = common global [1024 x [1024 x float]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %57, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 1024
  br i1 %4, label %5, label %60

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %53, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 1024
  br i1 %8, label %9, label %56

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [1024 x [1024 x float]]* @C, i32 0, i64 %13
  %15 = getelementptr inbounds [1024 x float]* %14, i32 0, i64 %11
  store float 0.000000e+00, float* %15, align 4
  store i32 0, i32* %k, align 4
  br label %16

; <label>:16                                      ; preds = %49, %9
  %17 = load i32* %k, align 4
  %18 = icmp slt i32 %17, 1024
  br i1 %18, label %19, label %52

; <label>:19                                      ; preds = %16
  %20 = load i32* %j, align 4
  %21 = sext i32 %20 to i64
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [1024 x [1024 x float]]* @C, i32 0, i64 %23
  %25 = getelementptr inbounds [1024 x float]* %24, i32 0, i64 %21
  %26 = load float* %25, align 4
  %27 = load i32* %k, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [1024 x [1024 x float]]* @A, i32 0, i64 %30
  %32 = getelementptr inbounds [1024 x float]* %31, i32 0, i64 %28
  %33 = load float* %32, align 4
  %34 = load i32* %j, align 4
  %35 = sext i32 %34 to i64
  %36 = load i32* %k, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [1024 x [1024 x float]]* @B, i32 0, i64 %37
  %39 = getelementptr inbounds [1024 x float]* %38, i32 0, i64 %35
  %40 = load float* %39, align 4
  %41 = fmul float %33, %40
  %42 = fadd float %26, %41
  %43 = load i32* %j, align 4
  %44 = sext i32 %43 to i64
  %45 = load i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [1024 x [1024 x float]]* @C, i32 0, i64 %46
  %48 = getelementptr inbounds [1024 x float]* %47, i32 0, i64 %44
  store float %42, float* %48, align 4
  br label %49

; <label>:49                                      ; preds = %19
  %50 = load i32* %k, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %k, align 4
  br label %16

; <label>:52                                      ; preds = %16
  br label %53

; <label>:53                                      ; preds = %52
  %54 = load i32* %j, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %j, align 4
  br label %6

; <label>:56                                      ; preds = %6
  br label %57

; <label>:57                                      ; preds = %56
  %58 = load i32* %i, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %i, align 4
  br label %2

; <label>:60                                      ; preds = %2
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 "}
