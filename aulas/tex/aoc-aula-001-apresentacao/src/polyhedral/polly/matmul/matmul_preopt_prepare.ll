; ModuleID = 'matmul_preopt.ll'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.8.3-9) 4.8.3 LLVM: 3.4.2\22"

@C = common global [1024 x [1024 x float]] zeroinitializer, align 32
@B = common global [1024 x [1024 x float]] zeroinitializer, align 32
@A = common global [1024 x [1024 x float]] zeroinitializer, align 32

; Function Attrs: nounwind uwtable
define i32 @main(...) unnamed_addr #0 {
entry:
  %.reg2mem = alloca float
  %.lcssa.reg2mem = alloca float
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %_bb_8_preheader

_bb_4_:                                         ; preds = %_bb_8>.preheader, %_bb_7_
  %indvars.iv13 = phi i64 [ 0, %_bb_8_preheader ], [ %5, %_bb_7_ ]
  %ar1 = getelementptr [1024 x [1024 x float]]* @C, i64 0, i64 %indvars.iv17, i64 %indvars.iv13
  store float 0.000000e+00, float* %ar1, align 4, !tbaa !0
  store float 0.000000e+00, float* %.reg2mem
  br label %_bb_5_

_bb_5_:                                         ; preds = %_bb_5_, %_bb_4_
  %indvars.iv = phi i64 [ 0, %_bb_4_ ], [ %4, %_bb_5_ ]
  %.reload = load float* %.reg2mem
  %ar5 = getelementptr [1024 x [1024 x float]]* @A, i64 0, i64 %indvars.iv17, i64 %indvars.iv
  %ar7 = getelementptr [1024 x [1024 x float]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv13
  %0 = load float* %ar5, align 4, !tbaa !0
  %1 = load float* %ar7, align 4, !tbaa !0
  %2 = fmul float %0, %1
  %3 = fadd float %.reload, %2
  %4 = add nuw nsw i64 %indvars.iv, 1
  %exitcond1 = icmp eq i64 %4, 1024
  store float %3, float* %.lcssa.reg2mem
  store float %3, float* %.reg2mem
  br i1 %exitcond1, label %_bb_7_, label %_bb_5_

_bb_7_:                                         ; preds = %_bb_5_
  %.lcssa.reload = load float* %.lcssa.reg2mem
  store float %.lcssa.reload, float* %ar1, align 4, !tbaa !0
  %5 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %5, 1024
  br i1 %exitcond, label %_bb_9_, label %_bb_4_

_bb_9_:                                         ; preds = %_bb_7_
  %6 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond2 = icmp eq i64 %6, 1024
  br i1 %exitcond2, label %_bb_11_, label %_bb_8_preheader

_bb_8_preheader:                               ; preds = %_bb_9_, %entry.split
  %indvars.iv17 = phi i64 [ 0, %entry.split ], [ %6, %_bb_9_ ]
  br label %_bb_4_

_bb_11_:                                        ; preds = %_bb_9_
  ret i32 0
}

attributes #0 = { nounwind uwtable "no-frame-pointer-elim-non-leaf"="false" }

!0 = metadata !{metadata !1, metadata !1, i64 0}
!1 = metadata !{metadata !"alias set 7: float", metadata !2}
!2 = metadata !{metadata !2}
