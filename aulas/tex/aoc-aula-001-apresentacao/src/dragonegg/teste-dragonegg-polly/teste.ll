; ModuleID = 'vectoradd.c'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.7.3-9) 4.7.3 LLVM: 3.3svn\22"

@.cst = linker_private unnamed_addr constant [21 x i8] c"C[0]: %d C[511]: %d\0A\00", align 8

; Function Attrs: nounwind uwtable
define i32 @main(...) unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = call noalias i8* @malloc(i64 2048) #1
  %1 = call noalias i8* @malloc(i64 2048) #1
  %2 = call noalias i8* @malloc(i64 2048) #1
  br label %"<bb 3>"

"<bb 3>":                                         ; preds = %entry.split, %"<bb 3>"
  %indvar13 = phi i64 [ 0, %entry.split ], [ %indvar.next14, %"<bb 3>" ]
  %i_17 = trunc i64 %indvar13 to i32
  %3 = mul i64 %indvar13, 4
  %scevgep16 = getelementptr i8* %1, i64 %3
  %D.2739_15 = bitcast i8* %scevgep16 to i32*
  %scevgep18 = getelementptr i8* %0, i64 %3
  %D.2738_12 = bitcast i8* %scevgep18 to i32*
  store i32 %i_17, i32* %D.2738_12, align 4, !tbaa !0
  store i32 %i_17, i32* %D.2739_15, align 4, !tbaa !0
  %indvar.next14 = add i64 %indvar13, 1
  %exitcond15 = icmp ne i64 %indvar.next14, 512
  br i1 %exitcond15, label %"<bb 3>", label %"<bb 7>.preheader"

"<bb 7>.preheader":                               ; preds = %"<bb 3>"
  %c_8 = bitcast i8* %2 to i32*
  br label %"<bb 6>"

"<bb 6>":                                         ; preds = %"<bb 7>.preheader", %"<bb 6>"
  %indvar = phi i64 [ 0, %"<bb 7>.preheader" ], [ %indvar.next, %"<bb 6>" ]
  %4 = mul i64 %indvar, 4
  %scevgep = getelementptr i8* %1, i64 %4
  %D.2739_27 = bitcast i8* %scevgep to i32*
  %scevgep9 = getelementptr i8* %0, i64 %4
  %D.2738_23 = bitcast i8* %scevgep9 to i32*
  %scevgep11 = getelementptr i8* %2, i64 %4
  %D.2740_20 = bitcast i8* %scevgep11 to i32*
  %D.2741_24 = load i32* %D.2738_23, align 4, !tbaa !0
  %D.2742_28 = load i32* %D.2739_27, align 4, !tbaa !0
  %D.2743_29 = add nsw i32 %D.2742_28, %D.2741_24
  store i32 %D.2743_29, i32* %D.2740_20, align 4, !tbaa !0
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp ne i64 %indvar.next, 512
  br i1 %exitcond, label %"<bb 6>", label %"<bb 8>"

"<bb 8>":                                         ; preds = %"<bb 6>"
  %pp5 = getelementptr inbounds i8* %2, i64 2044
  %D.2744_31 = bitcast i8* %pp5 to i32*
  %D.2745_32 = load i32* %D.2744_31, align 4, !tbaa !0
  %D.2746_33 = load i32* %c_8, align 4, !tbaa !0
  %5 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.cst, i64 0, i64 0), i32 %D.2746_33, i32 %D.2745_32) #1
  call void @free(i8* %0) #1
  call void @free(i8* %1) #1
  call void @free(i8* %2) #1
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...)

; Function Attrs: nounwind
declare void @free(i8*) #1

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind }

!0 = metadata !{metadata !"alias set 3: int", metadata !1}
!1 = metadata !{metadata !1}
