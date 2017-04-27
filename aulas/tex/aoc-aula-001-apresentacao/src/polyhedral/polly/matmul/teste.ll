; ModuleID = 'matmul.ll'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.8.3-9) 4.8.3 LLVM: 3.4.2\22"

@C = common global [1024 x [1024 x float]] zeroinitializer, align 32
@B = common global [1024 x [1024 x float]] zeroinitializer, align 32
@A = common global [1024 x [1024 x float]] zeroinitializer, align 32

; Function Attrs: nounwind uwtable
define i32 @main(...) unnamed_addr #0 {
entry:
  br label %"<bb 8>.preheader"

"<bb 4>":                                         ; preds = %"<bb 8>.preheader", %"<bb 7>"
  %indvars.iv13 = phi i64 [ 0, %"<bb 8>.preheader" ], [ %indvars.iv.next14, %"<bb 7>" ]
  %ar1 = getelementptr inbounds [1024 x [1024 x float]]* @C, i64 0, i64 %indvars.iv17, i64 %indvars.iv13
  store float 0.000000e+00, float* %ar1, align 4, !tbaa !0
  br label %"<bb 5>"

"<bb 5>":                                         ; preds = %"<bb 5>", %"<bb 4>"
  %indvars.iv = phi i64 [ 0, %"<bb 4>" ], [ %indvars.iv.next, %"<bb 5>" ]
  %0 = phi float [ 0.000000e+00, %"<bb 4>" ], [ %4, %"<bb 5>" ]
  %ar5 = getelementptr inbounds [1024 x [1024 x float]]* @A, i64 0, i64 %indvars.iv17, i64 %indvars.iv
  %1 = load float* %ar5, align 4, !tbaa !0
  %ar7 = getelementptr inbounds [1024 x [1024 x float]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv13
  %2 = load float* %ar7, align 4, !tbaa !0
  %3 = fmul float %1, %2
  %4 = fadd float %0, %3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1024
  br i1 %exitcond, label %"<bb 7>", label %"<bb 5>"

"<bb 7>":                                         ; preds = %"<bb 5>"
  store float %4, float* %ar1, align 4, !tbaa !0
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1024
  br i1 %exitcond15, label %"<bb 9>", label %"<bb 4>"

"<bb 9>":                                         ; preds = %"<bb 7>"
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 1024
  br i1 %exitcond19, label %"<bb 11>", label %"<bb 8>.preheader"

"<bb 8>.preheader":                               ; preds = %"<bb 9>", %entry
  %indvars.iv17 = phi i64 [ 0, %entry ], [ %indvars.iv.next18, %"<bb 9>" ]
  br label %"<bb 4>"

"<bb 11>":                                        ; preds = %"<bb 9>"
  ret i32 0
}

attributes #0 = { nounwind uwtable "no-frame-pointer-elim-non-leaf"="false" }

!0 = metadata !{metadata !1, metadata !1, i64 0}
!1 = metadata !{metadata !"alias set 7: float", metadata !2}
!2 = metadata !{metadata !2}
