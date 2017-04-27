; ModuleID = 'wavefront-skewed.c'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.8.3-9) 4.8.3 LLVM: 3.4.2\22"

@A = common global [5 x [5 x i32]] zeroinitializer, align 32

; Function Attrs: nounwind uwtable
define i32 @main(...) unnamed_addr #0 {
entry:
  br label %"<bb 4>"

"<bb 4>":                                         ; preds = %"<bb 7>", %entry
  %c1_111 = phi i32 [ 2, %entry ], [ %c1_42, %"<bb 7>" ]
  %0 = add nsw i32 %c1_111, -4
  %c2_18 = call i32 (...)* @max(i32 1, i32 %0) #1
  %1 = add nsw i32 %c1_111, -1
  %2 = call i32 (...)* @min(i32 %1, i32 4) #1
  %3 = icmp slt i32 %2, %c2_18
  br i1 %3, label %"<bb 7>", label %"<bb 5>.lr.ph"

"<bb 5>.lr.ph":                                   ; preds = %"<bb 4>"
  %4 = sext i32 %c2_18 to i64
  br label %"<bb 5>"

"<bb 5>":                                         ; preds = %"<bb 5>.lr.ph", %"<bb 5>"
  %indvars.iv = phi i64 [ %4, %"<bb 5>.lr.ph" ], [ %indvars.iv.next, %"<bb 5>" ]
  %5 = add nsw i64 %indvars.iv, -1
  %6 = trunc i64 %indvars.iv to i32
  %7 = sub nsw i32 %c1_111, %6
  %8 = sext i32 %7 to i64
  %ar1 = getelementptr inbounds [5 x [5 x i32]]* @A, i64 0, i64 %5, i64 %8
  %9 = load i32* %ar1, align 4, !tbaa !0
  %10 = add nsw i32 %7, -1
  %11 = sext i32 %10 to i64
  %ar3 = getelementptr inbounds [5 x [5 x i32]]* @A, i64 0, i64 %indvars.iv, i64 %11
  %12 = load i32* %ar3, align 4, !tbaa !0
  %13 = add nsw i32 %12, %9
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %ar5 = getelementptr inbounds [5 x [5 x i32]]* @A, i64 0, i64 %indvars.iv.next, i64 %8
  %14 = load i32* %ar5, align 4, !tbaa !0
  %15 = add nsw i32 %13, %14
  %16 = add nsw i32 %7, 1
  %17 = sext i32 %16 to i64
  %ar7 = getelementptr inbounds [5 x [5 x i32]]* @A, i64 0, i64 %indvars.iv, i64 %17
  %18 = load i32* %ar7, align 4, !tbaa !0
  %19 = add nsw i32 %15, %18
  %20 = sdiv i32 %19, 4
  %ar9 = getelementptr inbounds [5 x [5 x i32]]* @A, i64 0, i64 %indvars.iv, i64 %8
  store i32 %20, i32* %ar9, align 4, !tbaa !0
  %21 = call i32 (...)* @min(i32 %1, i32 4) #1
  %22 = trunc i64 %indvars.iv.next to i32
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %"<bb 7>", label %"<bb 5>"

"<bb 7>":                                         ; preds = %"<bb 5>", %"<bb 4>"
  %c1_42 = add nsw i32 %c1_111, 1
  %exitcond = icmp eq i32 %c1_42, 9
  br i1 %exitcond, label %"<bb 9>", label %"<bb 4>"

"<bb 9>":                                         ; preds = %"<bb 7>"
  ret i32 0
}

declare i32 @max(...)

declare i32 @min(...)

attributes #0 = { nounwind uwtable "no-frame-pointer-elim-non-leaf"="false" }
attributes #1 = { nounwind }

!0 = metadata !{metadata !"alias set 3: int", metadata !1}
!1 = metadata !{metadata !1}
