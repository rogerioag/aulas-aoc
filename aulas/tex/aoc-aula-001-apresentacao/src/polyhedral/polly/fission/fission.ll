; ModuleID = 'fission.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = common global [5 x i32] zeroinitializer, align 16
@B = common global [5 x [5 x i32]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %27, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %30

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [5 x i32]* @A, i32 0, i64 %8
  store i32 %6, i32* %9, align 4
  store i32 0, i32* %j, align 4
  br label %10

; <label>:10                                      ; preds = %23, %5
  %11 = load i32* %j, align 4
  %12 = icmp slt i32 %11, 5
  br i1 %12, label %13, label %26

; <label>:13                                      ; preds = %10
  %14 = load i32* %i, align 4
  %15 = load i32* %j, align 4
  %16 = add nsw i32 %14, %15
  %17 = load i32* %j, align 4
  %18 = sext i32 %17 to i64
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [5 x [5 x i32]]* @B, i32 0, i64 %20
  %22 = getelementptr inbounds [5 x i32]* %21, i32 0, i64 %18
  store i32 %16, i32* %22, align 4
  br label %23

; <label>:23                                      ; preds = %13
  %24 = load i32* %j, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %j, align 4
  br label %10

; <label>:26                                      ; preds = %10
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i32* %i, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %i, align 4
  br label %2

; <label>:30                                      ; preds = %2
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 "}