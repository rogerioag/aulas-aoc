; ModuleID = 'strip-mining_preopt.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = common global [5 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  br label %.split

.split:                                           ; preds = %0
  br label %1

; <label>:1                                       ; preds = %3, %.split
  %indvar = phi i64 [ %indvar.next, %3 ], [ 0, %.split ]
  %i.0 = trunc i64 %indvar to i32
  %scevgep = getelementptr [5 x i32]* @A, i64 0, i64 %indvar
  %exitcond = icmp ne i64 %indvar, 5
  br i1 %exitcond, label %2, label %4

; <label>:2                                       ; preds = %1
  store i32 %i.0, i32* %scevgep, align 4
  br label %3

; <label>:3                                       ; preds = %2
  %indvar.next = add i64 %indvar, 1
  br label %1

; <label>:4                                       ; preds = %1
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 "}
