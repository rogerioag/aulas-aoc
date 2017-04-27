; ModuleID = 'wavefront_preopt_prepare_indep_blocks.ll'
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
  br label %codeRepl

codeRepl:                                         ; preds = %entry.split
  call void @"main_<bb 5>.preheader"(i32* %.reg2mem)
  br label %"<bb 8>"

"<bb 8>":                                         ; preds = %codeRepl
  ret i32 0
}

; Function Attrs: nounwind
define internal void @"main_<bb 5>.preheader"(i32* %.reg2mem) #1 {
newFuncRoot:
  br label %"<bb 5>.preheader"

"<bb 8>.exitStub":                                ; preds = %"<bb 6>"
  ret void

"<bb 5>.preheader":                               ; preds = %newFuncRoot, %"<bb 6>.<bb 5>.preheader_crit_edge"
  %indvar2 = phi i64 [ %indvar.next3, %"<bb 6>.<bb 5>.preheader_crit_edge" ], [ 0, %newFuncRoot ]
  %0 = add i64 %indvar2, 1
  %ar3.phi.trans.insert = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %0, i64 0
  %.pre = load i32* %ar3.phi.trans.insert, align 4, !tbaa !0
  store i32 %.pre, i32* %.reg2mem
  br label %"<bb 4>"

"<bb 4>":                                         ; preds = %"<bb 4>.<bb 4>_crit_edge", %"<bb 5>.preheader"
  %indvar = phi i64 [ 0, %"<bb 5>.preheader" ], [ %indvar.next, %"<bb 4>.<bb 4>_crit_edge" ]
  %"indvars.iv.next13.moved.to.<bb 4>" = add i64 %indvar2, 2
  %".moved.to.<bb 4>" = add i64 %indvar2, 1
  %.reload = load i32* %.reg2mem
  %1 = add i64 %indvar, 1
  %ar1 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %indvar2, i64 %1
  %ar5 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %"indvars.iv.next13.moved.to.<bb 4>", i64 %1
  %2 = add i64 %indvar, 2
  %ar7 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %".moved.to.<bb 4>", i64 %2
  %ar9 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %".moved.to.<bb 4>", i64 %1
  %3 = load i32* %ar1, align 4, !tbaa !0
  %4 = add nsw i32 %.reload, %3
  %5 = load i32* %ar5, align 4, !tbaa !0
  %6 = add nsw i32 %4, %5
  %7 = load i32* %ar7, align 4, !tbaa !0
  %8 = add nsw i32 %6, %7
  %9 = sdiv i32 %8, 4
  store i32 %9, i32* %ar9, align 4, !tbaa !0
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, 4
  store i32 %9, i32* %.reg2mem
  br i1 %exitcond1, label %"<bb 6>", label %"<bb 4>.<bb 4>_crit_edge"

"<bb 4>.<bb 4>_crit_edge":                        ; preds = %"<bb 4>"
  br label %"<bb 4>"

"<bb 6>":                                         ; preds = %"<bb 4>"
  %indvar.next3 = add i64 %indvar2, 1
  %exitcond = icmp eq i64 %indvar.next3, 4
  br i1 %exitcond, label %"<bb 8>.exitStub", label %"<bb 6>.<bb 5>.preheader_crit_edge"

"<bb 6>.<bb 5>.preheader_crit_edge":              ; preds = %"<bb 6>"
  br label %"<bb 5>.preheader"
}

attributes #0 = { nounwind uwtable "no-frame-pointer-elim-non-leaf"="false" }
attributes #1 = { nounwind }

!0 = metadata !{metadata !1, metadata !1, i64 0}
!1 = metadata !{metadata !"alias set 3: int", metadata !2}
!2 = metadata !{metadata !2}
