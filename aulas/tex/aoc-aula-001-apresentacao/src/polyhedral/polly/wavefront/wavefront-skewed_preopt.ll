; ModuleID = 'wavefront-skewed.ll'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.8.3-9) 4.8.3 LLVM: 3.4.2\22"

@A = common global [5 x [5 x i32]] zeroinitializer, align 32

; Function Attrs: nounwind uwtable
define i32 @main(...) unnamed_addr #0 {
entry:
  br label %"<bb 4>"

"<bb 4>":                                         ; preds = %"<bb 7>", %entry
  %indvar1 = phi i32 [ %indvar.next2, %"<bb 7>" ], [ 0, %entry ]
  %0 = add i32 %indvar1, 1
  %c1_42 = add i32 %indvar1, 3
  %1 = add i32 %indvar1, 2
  %2 = add i32 %indvar1, -2
  %c2_18 = call i32 (...)* @max(i32 1, i32 %2) #1
  %3 = call i32 (...)* @min(i32 %0, i32 4) #1
  %4 = icmp slt i32 %3, %c2_18
  br i1 %4, label %"<bb 7>", label %"<bb 5>.lr.ph"

"<bb 5>.lr.ph":                                   ; preds = %"<bb 4>"
  %5 = sext i32 %c2_18 to i64
  %6 = sub i32 %1, %c2_18
  %7 = zext i32 %6 to i64
  %8 = sub i32 %c1_42, %c2_18
  %9 = zext i32 %8 to i64
  %10 = add i32 %c2_18, 1
  %11 = zext i32 %10 to i64
  %12 = add i64 %5, 1
  %13 = sub i32 %0, %c2_18
  %14 = zext i32 %13 to i64
  %15 = add i64 %5, -1
  br label %"<bb 5>"

"<bb 5>":                                         ; preds = %"<bb 5>", %"<bb 5>.lr.ph"
  %indvar = phi i64 [ %indvar.next, %"<bb 5>" ], [ 0, %"<bb 5>.lr.ph" ]
  %16 = add i64 %5, %indvar
  %scevgep = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %16, i64 0
  %17 = mul i64 %indvar, -1
  %18 = add i64 %7, %17
  %19 = trunc i64 %18 to i32
  %20 = sext i32 %19 to i64
  %ar9 = getelementptr i32* %scevgep, i64 %20
  %21 = add i64 %9, %17
  %22 = trunc i64 %21 to i32
  %23 = sext i32 %22 to i64
  %ar7 = getelementptr i32* %scevgep, i64 %23
  %24 = add i64 %11, %indvar
  %25 = trunc i64 %24 to i32
  %26 = add i64 %12, %indvar
  %scevgep5 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %26, i64 0
  %ar5 = getelementptr i32* %scevgep5, i64 %20
  %27 = add i64 %14, %17
  %28 = trunc i64 %27 to i32
  %29 = sext i32 %28 to i64
  %ar3 = getelementptr i32* %scevgep, i64 %29
  %30 = add i64 %15, %indvar
  %scevgep8 = getelementptr [5 x [5 x i32]]* @A, i64 0, i64 %30, i64 0
  %ar1 = getelementptr i32* %scevgep8, i64 %20
  %31 = load i32* %ar1, align 4, !tbaa !0
  %32 = load i32* %ar3, align 4, !tbaa !0
  %33 = add nsw i32 %32, %31
  %34 = load i32* %ar5, align 4, !tbaa !0
  %35 = add nsw i32 %33, %34
  %36 = load i32* %ar7, align 4, !tbaa !0
  %37 = add nsw i32 %35, %36
  %38 = sdiv i32 %37, 4
  store i32 %38, i32* %ar9, align 4, !tbaa !0
  %39 = call i32 (...)* @min(i32 %0, i32 4) #1
  %40 = icmp slt i32 %39, %25
  %indvar.next = add i64 %indvar, 1
  br i1 %40, label %"<bb 7>.loopexit", label %"<bb 5>"

"<bb 7>.loopexit":                                ; preds = %"<bb 5>"
  br label %"<bb 7>"

"<bb 7>":                                         ; preds = %"<bb 7>.loopexit", %"<bb 4>"
  %indvar.next2 = add i32 %indvar1, 1
  %exitcond10 = icmp eq i32 %indvar.next2, 7
  br i1 %exitcond10, label %"<bb 9>", label %"<bb 4>"

"<bb 9>":                                         ; preds = %"<bb 7>"
  ret i32 0
}

declare i32 @max(...)

declare i32 @min(...)

attributes #0 = { nounwind uwtable "no-frame-pointer-elim-non-leaf"="false" }
attributes #1 = { nounwind }

!0 = metadata !{metadata !1, metadata !1, i64 0}
!1 = metadata !{metadata !"alias set 3: int", metadata !2}
!2 = metadata !{metadata !2}
