; ModuleID = 'teste-001.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @magica(i32 %x, i32 %y, i32 %z, i32 %w, i32 %t) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %z, i32* %3, align 4
  store i32 %w, i32* %4, align 4
  store i32 %t, i32* %5, align 4
  store i32 0, i32* %res, align 4
  %6 = load i32* %1, align 4
  %7 = load i32* %2, align 4
  %8 = add nsw i32 %6, %7
  %9 = load i32* %3, align 4
  %10 = load i32* %4, align 4
  %11 = add nsw i32 %9, %10
  %12 = sub nsw i32 %8, %11
  %13 = load i32* %5, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, i32* %res, align 4
  %15 = load i32* %res, align 4
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 0, i32* %1
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32 4, i32* %c, align 4
  store i32 5, i32* %d, align 4
  store i32 6, i32* %e, align 4
  store i32 0, i32* %f, align 4
  %2 = load i32* %a, align 4
  %3 = load i32* %b, align 4
  %4 = load i32* %c, align 4
  %5 = load i32* %d, align 4
  %6 = load i32* %e, align 4
  %7 = call i32 @magica(i32 %2, i32 %3, i32 %4, i32 %5, i32 %6)
  store i32 %7, i32* %f, align 4
  %8 = load i32* %f, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %8)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Debian clang version 3.5.0-10 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
