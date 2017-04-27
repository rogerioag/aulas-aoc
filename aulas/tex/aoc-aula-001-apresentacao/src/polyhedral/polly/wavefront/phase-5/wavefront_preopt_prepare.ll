; ModuleID = 'wavefront_preopt.ll'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.8.3-9) 4.8.3 LLVM: 3.4.2\22"

@A = common global [5 x [5 x i32]] zeroinitializer, align 32

; Function Attrs: nounwind uwtable
define i32 @main(...) unnamed_addr #0 {
entry:
  %.reg2mem = alloca i32
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %"<bb 5>.preheader"

"<bb 4>":                                         ; preds = %"<bb 5>.preheader", %"<bb 4>"
  %indvar = phi i64 [ 0, %"<bb 5>.preheader" ], [ %indvar.next, %"<bb 4>" ]
  %.reload = load i32* %.reg2mem
  %0 = add i64 %indvar, 1
  %ar1 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %indvar2, i64 %0
  %ar5 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %indvars.iv.next13, i64 %0
  %1 = add i64 %indvar, 2
  %ar7 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %9, i64 %1
  %ar9 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %9, i64 %0
  %2 = load i32* %ar1, align 4, !tbaa !0
  %3 = add nsw i32 %.reload, %2
  %4 = load i32* %ar5, align 4, !tbaa !0
  %5 = add nsw i32 %3, %4
  %6 = load i32* %ar7, align 4, !tbaa !0
  %7 = add nsw i32 %5, %6
  %8 = sdiv i32 %7, 4
  store i32 %8, i32* %ar9, align 4, !tbaa !0
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, 4
  store i32 %8, i32* %.reg2mem
  br i1 %exitcond1, label %"<bb 6>", label %"<bb 4>"

"<bb 6>":                                         ; preds = %"<bb 4>"
  %indvar.next3 = add i64 %indvar2, 1
  %exitcond = icmp eq i64 %indvar.next3, 4
  br i1 %exitcond, label %"<bb 8>", label %"<bb 5>.preheader"

"<bb 5>.preheader":                               ; preds = %"<bb 6>", %entry.split
  %indvar2 = phi i64 [ %indvar.next3, %"<bb 6>" ], [ 0, %entry.split ]
  %indvars.iv.next13 = add i64 %indvar2, 2
  %9 = add i64 %indvar2, 1
  %ar3.phi.trans.insert = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %9, i64 0
  %.pre = load i32* %ar3.phi.trans.insert, align 4, !tbaa !0
  store i32 %.pre, i32* %.reg2mem
  br label %"<bb 4>"

"<bb 8>":                                         ; preds = %"<bb 6>"
  ret i32 0
}

attributes #0 = { nounwind uwtable "no-frame-pointer-elim-non-leaf"="false" }

!0 = metadata !{metadata !1, metadata !1, i64 0}
!1 = metadata !{metadata !"alias set 3: int", metadata !2}
!2 = metadata !{metadata !2}
