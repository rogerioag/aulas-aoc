; ModuleID = 'interchange_preopt.ll'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.8.3-9) 4.8.3 LLVM: 3.4.2\22"

@.cst = linker_private unnamed_addr constant [13 x i8] c"S1 (%d, %d)\0A\00", align 8
@.cst1 = linker_private unnamed_addr constant [32 x i8] c"Number of integral points: %d.\0A\00", align 64

; Function Attrs: nounwind uwtable
define i32 @main(...) unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %"<bb 5>.preheader"

"<bb 4>":                                         ; preds = %"<bb 5>.preheader", %"<bb 4>"
  %0 = phi i32 [ 0, %"<bb 5>.preheader" ], [ %2, %"<bb 4>" ]
  %1 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.cst, i64 0, i64 0), i32 %4, i32 %0) #1
  %2 = add nsw i32 %0, 1
  %exitcond1 = icmp eq i32 %2, 5
  br i1 %exitcond1, label %"<bb 6>", label %"<bb 4>"

"<bb 6>":                                         ; preds = %"<bb 4>"
  %3 = add nsw i32 %4, 1
  %exitcond = icmp eq i32 %3, 5
  br i1 %exitcond, label %"<bb 8>", label %"<bb 5>.preheader"

"<bb 5>.preheader":                               ; preds = %"<bb 6>", %entry.split
  %4 = phi i32 [ 0, %entry.split ], [ %3, %"<bb 6>" ]
  br label %"<bb 4>"

"<bb 8>":                                         ; preds = %"<bb 6>"
  %5 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([32 x i8]* @.cst1, i64 0, i64 0), i32 25) #1
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

attributes #0 = { nounwind uwtable "no-frame-pointer-elim-non-leaf"="false" }
attributes #1 = { nounwind }
