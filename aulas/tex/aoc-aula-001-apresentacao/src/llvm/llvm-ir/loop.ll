; ModuleID = 'loop.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %res, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2     ; preds = %9, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 100
  br i1 %4, label %5, label %12

; <label>:5     ; preds = %2
  %6 = load i32* %res, align 4
  %7 = load i32* %i, align 4
  %8 = add nsw i32 %6, %7
  store i32 %8, i32* %res, align 4
  br label %9

; <label>:9     ; preds = %5
  %10 = load i32* %i, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %i, align 4
  br label %2

; <label>:12    ; preds = %2
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Debian clang version 3.4.2-13 (tags/RELEASE_34/dot2-final) (based on LLVM 3.4.2)"}
