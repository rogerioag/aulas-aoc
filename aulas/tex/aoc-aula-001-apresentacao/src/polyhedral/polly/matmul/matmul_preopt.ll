; ModuleID = 'matmul.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@C = common global [1024 x [1024 x float]] zeroinitializer, align 16
@A = common global [1024 x [1024 x float]] zeroinitializer, align 16
@B = common global [1024 x [1024 x float]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  br label %1

; <label>:1                                       ; preds = %16, %0
  %indvar3 = phi i64 [ %indvar.next4, %16 ], [ 0, %0 ]
  %exitcond9 = icmp ne i64 %indvar3, 1024
  br i1 %exitcond9, label %2, label %17

; <label>:2                                       ; preds = %1
  br label %3

; <label>:3                                       ; preds = %14, %2
  %indvar1 = phi i64 [ %indvar.next2, %14 ], [ 0, %2 ]
  %scevgep8 = getelementptr [1024 x [1024 x float]]* @C, i64 0, i64 %indvar3, i64 %indvar1
  %exitcond6 = icmp ne i64 %indvar1, 1024
  br i1 %exitcond6, label %4, label %15

; <label>:4                                       ; preds = %3
  store float 0.000000e+00, float* %scevgep8, align 4
  br label %5

; <label>:5                                       ; preds = %12, %4
  %indvar = phi i64 [ %indvar.next, %12 ], [ 0, %4 ]
  %scevgep5 = getelementptr [1024 x [1024 x float]]* @A, i64 0, i64 %indvar3, i64 %indvar
  %scevgep = getelementptr [1024 x [1024 x float]]* @B, i64 0, i64 %indvar, i64 %indvar1
  %exitcond = icmp ne i64 %indvar, 1024
  br i1 %exitcond, label %6, label %13

; <label>:6                                       ; preds = %5
  %7 = load float* %scevgep8, align 4
  %8 = load float* %scevgep5, align 4
  %9 = load float* %scevgep, align 4
  %10 = fmul float %8, %9
  %11 = fadd float %7, %10
  store float %11, float* %scevgep8, align 4
  br label %12

; <label>:12                                      ; preds = %6
  %indvar.next = add i64 %indvar, 1
  br label %5

; <label>:13                                      ; preds = %5
  br label %14

; <label>:14                                      ; preds = %13
  %indvar.next2 = add i64 %indvar1, 1
  br label %3

; <label>:15                                      ; preds = %3
  br label %16

; <label>:16                                      ; preds = %15
  %indvar.next4 = add i64 %indvar3, 1
  br label %1

; <label>:17                                      ; preds = %1
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 "}
