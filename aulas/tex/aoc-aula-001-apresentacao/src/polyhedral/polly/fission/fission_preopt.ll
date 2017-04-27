; ModuleID = 'fission.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = common global [5 x i32] zeroinitializer, align 16
@B = common global [5 x [5 x i32]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  br label %1

; <label>:1                                       ; preds = %9, %0
  %indvar1 = phi i64 [ %indvar.next2, %9 ], [ 0, %0 ]
  %i.0 = trunc i64 %indvar1 to i32
  %scevgep5 = getelementptr [5 x i32]* @A, i64 0, i64 %indvar1
  %exitcond3 = icmp ne i64 %indvar1, 5
  br i1 %exitcond3, label %2, label %10

; <label>:2                                       ; preds = %1
  store i32 %i.0, i32* %scevgep5, align 4
  br label %3

; <label>:3                                       ; preds = %7, %2
  %indvar = phi i64 [ %indvar.next, %7 ], [ 0, %2 ]
  %4 = add i64 %indvar1, %indvar
  %5 = trunc i64 %4 to i32
  %scevgep = getelementptr [5 x [5 x i32]]* @B, i64 0, i64 %indvar1, i64 %indvar
  %exitcond = icmp ne i64 %indvar, 5
  br i1 %exitcond, label %6, label %8

; <label>:6                                       ; preds = %3
  store i32 %5, i32* %scevgep, align 4
  br label %7

; <label>:7                                       ; preds = %6
  %indvar.next = add i64 %indvar, 1
  br label %3

; <label>:8                                       ; preds = %3
  br label %9

; <label>:9                                       ; preds = %8
  %indvar.next2 = add i64 %indvar1, 1
  br label %1

; <label>:10                                      ; preds = %1
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 "}
