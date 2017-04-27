; ModuleID = 'hello.c'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.7.3-9) 4.7.3 LLVM: 3.3.1\22"

@.cst = linker_private unnamed_addr constant [13 x i8] c"hello, world\00", align 8

; Function Attrs: nounwind uwtable
define i32 @main(...) unnamed_addr #0 {
entry:
  %"<retval>" = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %"ssa point" = bitcast i32 0 to i32
  br label %"<bb 2>"

"<bb 2>":                                         ; preds = %entry
  %0 = call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @.cst, i64 0, i64 0)) #1
  br label %return

return:                                           ; preds = %"<bb 2>"
  %1 = load i32* %"<retval>", align 4
  ret i32 %1
}

declare i32 @puts(i8*)

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind }
