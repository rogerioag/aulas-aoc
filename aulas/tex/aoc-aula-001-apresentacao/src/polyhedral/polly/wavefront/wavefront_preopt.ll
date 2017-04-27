; ModuleID = 'wavefront.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = common global [5 x [5 x i32]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  br label %1

; <label>:1                                       ; preds = %19, %0
  %indvar1 = phi i64 [ %indvar.next2, %19 ], [ 0, %0 ]
  %2 = add i64 %indvar1, 2
  %3 = add i64 %indvar1, 1
  %exitcond7 = icmp ne i64 %indvar1, 4
  br i1 %exitcond7, label %4, label %20

; <label>:4                                       ; preds = %1
  br label %5

; <label>:5                                       ; preds = %17, %4
  %indvar = phi i64 [ %indvar.next, %17 ], [ 0, %4 ]
  %6 = add i64 %indvar, 1
  %scevgep6 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %indvar1, i64 %6
  %scevgep4 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %2, i64 %6
  %scevgep5 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %3, i64 %indvar
  %7 = add i64 %indvar, 2
  %scevgep3 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %3, i64 %7
  %scevgep = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %3, i64 %6
  %exitcond = icmp ne i64 %indvar, 4
  br i1 %exitcond, label %8, label %18

; <label>:8                                       ; preds = %5
  %9 = load i32* %scevgep6, align 4
  %10 = load i32* %scevgep5, align 4
  %11 = add nsw i32 %9, %10
  %12 = load i32* %scevgep4, align 4
  %13 = add nsw i32 %11, %12
  %14 = load i32* %scevgep3, align 4
  %15 = add nsw i32 %13, %14
  %16 = sdiv i32 %15, 4
  store i32 %16, i32* %scevgep, align 4
  br label %17

; <label>:17                                      ; preds = %8
  %indvar.next = add i64 %indvar, 1
  br label %5

; <label>:18                                      ; preds = %5
  br label %19

; <label>:19                                      ; preds = %18
  %indvar.next2 = add i64 %indvar1, 1
  br label %1

; <label>:20                                      ; preds = %1
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 "}
