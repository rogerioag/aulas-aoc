; ModuleID = 'interchange_preopt_prepare_indep_blocks.ll'
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
  br label %codeRepl

codeRepl:                                         ; preds = %entry.split
  call void @"main_<bb 5>.preheader"()
  br label %"<bb 8>"

"<bb 8>":                                         ; preds = %codeRepl
  %0 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([32 x i8]* @.cst1, i64 0, i64 0), i32 25) #1
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
define internal void @"main_<bb 5>.preheader"() #1 {
newFuncRoot:
  br label %"<bb 5>.preheader"

"<bb 8>.exitStub":                                ; preds = %"<bb 6>"
  ret void

"<bb 5>.preheader":                               ; preds = %newFuncRoot, %"<bb 6>.<bb 5>.preheader_crit_edge"
  %0 = phi i32 [ 0, %newFuncRoot ], [ %4, %"<bb 6>.<bb 5>.preheader_crit_edge" ]
  br label %"<bb 4>"

"<bb 4>":                                         ; preds = %"<bb 4>.<bb 4>_crit_edge", %"<bb 5>.preheader"
  %1 = phi i32 [ 0, %"<bb 5>.preheader" ], [ %3, %"<bb 4>.<bb 4>_crit_edge" ]
  %2 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.cst, i64 0, i64 0), i32 %0, i32 %1) #1
  %3 = add nsw i32 %1, 1
  %exitcond1 = icmp eq i32 %3, 5
  br i1 %exitcond1, label %"<bb 6>", label %"<bb 4>.<bb 4>_crit_edge"

"<bb 4>.<bb 4>_crit_edge":                        ; preds = %"<bb 4>"
  br label %"<bb 4>"

"<bb 6>":                                         ; preds = %"<bb 4>"
  %4 = add nsw i32 %0, 1
  %exitcond = icmp eq i32 %4, 5
  br i1 %exitcond, label %"<bb 8>.exitStub", label %"<bb 6>.<bb 5>.preheader_crit_edge"

"<bb 6>.<bb 5>.preheader_crit_edge":              ; preds = %"<bb 6>"
  br label %"<bb 5>.preheader"
}

attributes #0 = { nounwind uwtable "no-frame-pointer-elim-non-leaf"="false" }
attributes #1 = { nounwind }
