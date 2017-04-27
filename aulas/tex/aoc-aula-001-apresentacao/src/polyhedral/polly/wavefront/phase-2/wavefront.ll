; ModuleID = 'wavefront.c'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.8.3-9) 4.8.3 LLVM: 3.4.2\22"

@A = common global [5 x [5 x i32]] zeroinitializer, align 32

; Function Attrs: nounwind uwtable
define i32 @main(...) unnamed_addr #0 {
entry:
  br label %"<bb 5>.preheader"

"<bb 4>":                                         ; preds = %"<bb 4>", %"<bb 5>.preheader"
  %0 = phi i32 [ %.pre, %"<bb 5>.preheader" ], [ %7, %"<bb 4>" ]
  %indvars.iv = phi i64 [ 1, %"<bb 5>.preheader" ], [ %indvars.iv.next, %"<bb 4>" ]
  %ar1 = getelementptr inbounds [5 x [5 x i32]]* @A, i64 0, i64 %8, i64 %indvars.iv
  %1 = load i32* %ar1, align 4, !tbaa !0
  %2 = add nsw i32 %0, %1
  %ar5 = getelementptr inbounds [5 x [5 x i32]]* @A, i64 0, i64 %indvars.iv.next13, i64 %indvars.iv
  %3 = load i32* %ar5, align 4, !tbaa !0
  %4 = add nsw i32 %2, %3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %ar7 = getelementptr inbounds [5 x [5 x i32]]* @A, i64 0, i64 %indvars.iv12, i64 %indvars.iv.next
  %5 = load i32* %ar7, align 4, !tbaa !0
  %6 = add nsw i32 %4, %5
  %7 = sdiv i32 %6, 4
  %ar9 = getelementptr inbounds [5 x [5 x i32]]* @A, i64 0, i64 %indvars.iv12, i64 %indvars.iv
  store i32 %7, i32* %ar9, align 4, !tbaa !0
  %exitcond = icmp eq i64 %indvars.iv.next, 5
  br i1 %exitcond, label %"<bb 6>", label %"<bb 4>"

"<bb 6>":                                         ; preds = %"<bb 4>"
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 5
  br i1 %exitcond14, label %"<bb 8>", label %"<bb 5>.preheader"

"<bb 5>.preheader":                               ; preds = %"<bb 6>", %entry
  %indvars.iv12 = phi i64 [ 1, %entry ], [ %indvars.iv.next13, %"<bb 6>" ]
  %8 = add nsw i64 %indvars.iv12, -1
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %ar3.phi.trans.insert = getelementptr inbounds [5 x [5 x i32]]* @A, i64 0, i64 %indvars.iv12, i64 0
  %.pre = load i32* %ar3.phi.trans.insert, align 4, !tbaa !0
  br label %"<bb 4>"

"<bb 8>":                                         ; preds = %"<bb 6>"
  ret i32 0
}

attributes #0 = { nounwind uwtable "no-frame-pointer-elim-non-leaf"="false" }

!0 = metadata !{metadata !"alias set 3: int", metadata !1}
!1 = metadata !{metadata !1}
