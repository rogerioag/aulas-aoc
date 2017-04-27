; ModuleID = 'wavefront.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = common global [5 x [5 x i32]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %n, align 4
  store i32 5, i32* %m, align 4
  store i32 1, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %60, %0
  %3 = load i32* %i, align 4
  %4 = load i32* %n, align 4
  %5 = sub nsw i32 %4, 1
  %6 = icmp sle i32 %3, %5
  br i1 %6, label %7, label %63

; <label>:7                                       ; preds = %2
  store i32 1, i32* %j, align 4
  br label %8

; <label>:8                                       ; preds = %56, %7
  %9 = load i32* %j, align 4
  %10 = load i32* %m, align 4
  %11 = sub nsw i32 %10, 1
  %12 = icmp sle i32 %9, %11
  br i1 %12, label %13, label %59

; <label>:13                                      ; preds = %8
  %14 = load i32* %j, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32* %i, align 4
  %17 = sub nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [5 x [5 x i32]]* @A, i32 0, i64 %18
  %20 = getelementptr inbounds [5 x i32]* %19, i32 0, i64 %15
  %21 = load i32* %20, align 4
  %22 = load i32* %j, align 4
  %23 = sub nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = load i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [5 x [5 x i32]]* @A, i32 0, i64 %26
  %28 = getelementptr inbounds [5 x i32]* %27, i32 0, i64 %24
  %29 = load i32* %28, align 4
  %30 = add nsw i32 %21, %29
  %31 = load i32* %j, align 4
  %32 = sext i32 %31 to i64
  %33 = load i32* %i, align 4
  %34 = add nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [5 x [5 x i32]]* @A, i32 0, i64 %35
  %37 = getelementptr inbounds [5 x i32]* %36, i32 0, i64 %32
  %38 = load i32* %37, align 4
  %39 = add nsw i32 %30, %38
  %40 = load i32* %j, align 4
  %41 = add nsw i32 %40, 1
  %42 = sext i32 %41 to i64
  %43 = load i32* %i, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [5 x [5 x i32]]* @A, i32 0, i64 %44
  %46 = getelementptr inbounds [5 x i32]* %45, i32 0, i64 %42
  %47 = load i32* %46, align 4
  %48 = add nsw i32 %39, %47
  %49 = sdiv i32 %48, 4
  %50 = load i32* %j, align 4
  %51 = sext i32 %50 to i64
  %52 = load i32* %i, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [5 x [5 x i32]]* @A, i32 0, i64 %53
  %55 = getelementptr inbounds [5 x i32]* %54, i32 0, i64 %51
  store i32 %49, i32* %55, align 4
  br label %56

; <label>:56                                      ; preds = %13
  %57 = load i32* %j, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %j, align 4
  br label %8

; <label>:59                                      ; preds = %8
  br label %60

; <label>:60                                      ; preds = %59
  %61 = load i32* %i, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %i, align 4
  br label %2

; <label>:63                                      ; preds = %2
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 "}
