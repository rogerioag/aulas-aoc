; ModuleID = 'interchange.c'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.8.3-9) 4.8.3 LLVM: 3.4.2\22"

@A = common global [5 x [5 x i32]] zeroinitializer, align 32
@.cst = linker_private unnamed_addr constant [32 x i8] c"Number of integral points: %d.\0A\00", align 64

; Function Attrs: nounwind uwtable
define i32 @main(...) unnamed_addr #0 {
entry:
  br label %"<bb 5>.preheader"

"<bb 4>":                                         ; preds = %"<bb 4>", %"<bb 5>.preheader"
  %indvars.iv = phi i64 [ 0, %"<bb 5>.preheader" ], [ %indvars.iv.next, %"<bb 4>" ]
  %0 = add nsw i64 %indvars.iv, %indvars.iv4
  %ar1 = getelementptr inbounds [5 x [5 x i32]]* @A, i64 0, i64 %indvars.iv4, i64 %indvars.iv
  %1 = trunc i64 %0 to i32
  store i32 %1, i32* %ar1, align 4, !tbaa !0
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 5
  br i1 %exitcond, label %"<bb 6>", label %"<bb 4>"

"<bb 6>":                                         ; preds = %"<bb 4>"
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 5
  br i1 %exitcond6, label %"<bb 8>", label %"<bb 5>.preheader"

"<bb 5>.preheader":                               ; preds = %"<bb 6>", %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %"<bb 6>" ]
  br label %"<bb 4>"

"<bb 8>":                                         ; preds = %"<bb 6>"
  %2 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([32 x i8]* @.cst, i64 0, i64 0), i32 0) #1
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

attributes #0 = { nounwind uwtable "no-frame-pointer-elim-non-leaf"="false" }
attributes #1 = { nounwind }

!0 = metadata !{metadata !"alias set 3: int", metadata !1}
!1 = metadata !{metadata !1}
