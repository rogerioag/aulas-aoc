; ModuleID = 'vectoradd.c-dragonegg-ir.ll'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.7.3-4) 4.7.3 LLVM: 3.3.1\22"

@.cst = linker_private unnamed_addr constant [20 x i8] c"C[0]: %d c[512]: %d\00", align 8

; Function Attrs: nounwind uwtable
define i32 @main(...) unnamed_addr #0 {
entry:
  %n = alloca i32
  %a = alloca i32*
  %b = alloca i32*
  %c = alloca i32*
  %bytes = alloca i64
  %i = alloca i32
  %"<retval>" = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %"ssa point" = bitcast i32 0 to i32
  br label %"<bb 2>"

"<bb 2>":                                         ; preds = %entry
  %0 = call noalias i8* @malloc(i64 2048) #1
  %a_6 = bitcast i8* %0 to i32*
  %1 = call noalias i8* @malloc(i64 2048) #1
  %b_7 = bitcast i8* %1 to i32*
  %2 = call noalias i8* @malloc(i64 2048) #1
  %c_8 = bitcast i8* %2 to i32*
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %"<bb 2>"
  br i1 true, label %polly.start, label %"<bb 4>"

"<bb 3>":                                         ; preds = %"<bb 4>"
  %D.2736_10 = sext i32 %i_1 to i64
  %D.2737_11 = mul i64 %D.2736_10, 4
  %3 = bitcast i32* %a_6 to i8*
  %pp = getelementptr inbounds i8* %3, i64 %D.2737_11
  %D.2738_12 = bitcast i8* %pp to i32*
  store i32 %i_1, i32* %D.2738_12, align 4, !tbaa !0
  %D.2736_13 = sext i32 %i_1 to i64
  %D.2737_14 = mul i64 %D.2736_13, 4
  %4 = bitcast i32* %b_7 to i8*
  %pp1 = getelementptr inbounds i8* %4, i64 %D.2737_14
  %D.2739_15 = bitcast i8* %pp1 to i32*
  store i32 %i_1, i32* %D.2739_15, align 4, !tbaa !0
  %i_16 = add nsw i32 %i_1, 1
  br label %"<bb 4>"

"<bb 4>":                                         ; preds = %polly.split_new_and_old, %"<bb 3>"
  %i_1 = phi i32 [ %i_16, %"<bb 3>" ], [ 0, %polly.split_new_and_old ]
  %5 = icmp slt i32 %i_1, 512
  br i1 %5, label %"<bb 3>", label %"<bb 5>"

"<bb 5>":                                         ; preds = %"<bb 4>"
  br label %"<bb 7>"

"<bb 6>":                                         ; preds = %"<bb 7>"
  %D.2736_18 = sext i32 %i_2 to i64
  %D.2737_19 = mul i64 %D.2736_18, 4
  %6 = bitcast i32* %c_8 to i8*
  %pp2 = getelementptr inbounds i8* %6, i64 %D.2737_19
  %D.2740_20 = bitcast i8* %pp2 to i32*
  %D.2736_21 = sext i32 %i_2 to i64
  %D.2737_22 = mul i64 %D.2736_21, 4
  %7 = bitcast i32* %a_6 to i8*
  %pp3 = getelementptr inbounds i8* %7, i64 %D.2737_22
  %D.2738_23 = bitcast i8* %pp3 to i32*
  %D.2741_24 = load i32* %D.2738_23, align 4, !tbaa !0
  %D.2736_25 = sext i32 %i_2 to i64
  %D.2737_26 = mul i64 %D.2736_25, 4
  %8 = bitcast i32* %b_7 to i8*
  %pp4 = getelementptr inbounds i8* %8, i64 %D.2737_26
  %D.2739_27 = bitcast i8* %pp4 to i32*
  %D.2742_28 = load i32* %D.2739_27, align 4, !tbaa !0
  %D.2743_29 = add nsw i32 %D.2741_24, %D.2742_28
  store i32 %D.2743_29, i32* %D.2740_20, align 4, !tbaa !0
  %i_30 = add nsw i32 %i_2, 1
  br label %"<bb 7>"

"<bb 7>":                                         ; preds = %"<bb 6>", %"<bb 5>"
  %i_2 = phi i32 [ %i_30, %"<bb 6>" ], [ 0, %"<bb 5>" ]
  %9 = icmp slt i32 %i_2, 512
  br i1 %9, label %"<bb 6>", label %polly.merge_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.start, %"<bb 7>"
  %10 = bitcast i32* %c_8 to i8*
  %pp5 = getelementptr inbounds i8* %10, i64 2048
  %D.2744_31 = bitcast i8* %pp5 to i32*
  %D.2745_32 = load i32* %D.2744_31, align 4, !tbaa !0
  %D.2746_33 = load i32* %c_8, align 4, !tbaa !0
  %11 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([20 x i8]* @.cst, i64 0, i64 0), i32 %D.2746_33, i32 %D.2745_32) #1
  %12 = bitcast i32* %a_6 to i8*
  call void @free(i8* %12) #1
  %13 = bitcast i32* %b_7 to i8*
  call void @free(i8* %13) #1
  %14 = bitcast i32* %c_8 to i8*
  call void @free(i8* %14) #1
  store i32 0, i32* %"<retval>", align 1
  br label %return

return:                                           ; preds = %polly.merge_new_and_old
  %15 = load i32* %"<retval>", align 4
  ret i32 %15

polly.start:                                      ; preds = %polly.split_new_and_old
  %omp.userContext = alloca { i32*, i32* }
  %16 = getelementptr inbounds { i32*, i32* }* %omp.userContext, i32 0, i32 0
  store i32* %a_6, i32** %16
  %17 = getelementptr inbounds { i32*, i32* }* %omp.userContext, i32 0, i32 1
  store i32* %b_7, i32** %17
  %omp_data = bitcast { i32*, i32* }* %omp.userContext to i8*
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* @main.omp_subfn, i8* %omp_data, i32 0, i64 0, i64 512, i64 1)
  call void @main.omp_subfn(i8* %omp_data)
  call void @GOMP_parallel_end()
  %omp.userContext1 = alloca { i32*, i32*, i32* }
  %18 = getelementptr inbounds { i32*, i32*, i32* }* %omp.userContext1, i32 0, i32 0
  store i32* %a_6, i32** %18
  %19 = getelementptr inbounds { i32*, i32*, i32* }* %omp.userContext1, i32 0, i32 1
  store i32* %b_7, i32** %19
  %20 = getelementptr inbounds { i32*, i32*, i32* }* %omp.userContext1, i32 0, i32 2
  store i32* %c_8, i32** %20
  %omp_data2 = bitcast { i32*, i32*, i32* }* %omp.userContext1 to i8*
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* @main.omp_subfn1, i8* %omp_data2, i32 0, i64 0, i64 512, i64 1)
  call void @main.omp_subfn1(i8* %omp_data2)
  call void @GOMP_parallel_end()
  br label %polly.merge_new_and_old
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...)

; Function Attrs: nounwind
declare void @free(i8*) #1

define internal void @main.omp_subfn(i8* %omp.userContext) {
omp.setup:
  %omp.lowerBoundPtr = alloca i64
  %omp.upperBoundPtr = alloca i64
  %omp.userContext1 = bitcast i8* %omp.userContext to { i32*, i32* }*
  %0 = getelementptr inbounds { i32*, i32* }* %omp.userContext1, i32 0, i32 0
  %1 = load i32** %0
  %2 = getelementptr inbounds { i32*, i32* }* %omp.userContext1, i32 0, i32 1
  %3 = load i32** %2
  br label %omp.checkNext

omp.exit:                                         ; preds = %omp.checkNext
  call void @GOMP_loop_end_nowait()
  ret void

omp.checkNext:                                    ; preds = %polly.loop_exit, %omp.setup
  %4 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr, i64* %omp.upperBoundPtr)
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %omp.loadIVBounds, label %omp.exit

omp.loadIVBounds:                                 ; preds = %omp.checkNext
  %omp.lowerBound = load i64* %omp.lowerBoundPtr
  %omp.upperBound = load i64* %omp.upperBoundPtr
  %omp.upperBoundAdjusted = sub i64 %omp.upperBound, 1
  br label %polly.loop_if

polly.loop_exit:                                  ; preds = %"polly.stmt.<bb 3>", %polly.loop_if
  br label %omp.checkNext

polly.loop_if:                                    ; preds = %omp.loadIVBounds
  %polly.loop_guard = icmp sle i64 %omp.lowerBound, %omp.upperBoundAdjusted
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %polly.loop_exit

polly.loop_header:                                ; preds = %"polly.stmt.<bb 3>", %polly.loop_preheader
  %polly.indvar = phi i64 [ %omp.lowerBound, %polly.loop_preheader ], [ %polly.indvar_next, %"polly.stmt.<bb 3>" ]
  %6 = mul i64 1, %polly.indvar
  %7 = trunc i64 %6 to i32
  br label %"polly.stmt.<bb 3>"

"polly.stmt.<bb 3>":                              ; preds = %polly.loop_header
  %p_D.2736_10 = sext i32 %7 to i64
  %p_D.2737_11 = mul i64 %p_D.2736_10, 4
  %p_ = bitcast i32* %1 to i8*
  %p_pp = getelementptr inbounds i8* %p_, i64 %p_D.2737_11
  %p_D.2738_12 = bitcast i8* %p_pp to i32*
  store i32 %7, i32* %p_D.2738_12
  %p_D.2736_13 = sext i32 %7 to i64
  %p_D.2737_14 = mul i64 %p_D.2736_13, 4
  %p_2 = bitcast i32* %3 to i8*
  %p_pp1 = getelementptr inbounds i8* %p_2, i64 %p_D.2737_14
  %p_D.2739_15 = bitcast i8* %p_pp1 to i32*
  store i32 %7, i32* %p_D.2739_15
  %p_i_16 = add nsw i32 %7, 1
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.adjust_ub = sub i64 %omp.upperBoundAdjusted, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.loop_if
  br label %polly.loop_header
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @main.omp_subfn1(i8* %omp.userContext) {
omp.setup:
  %omp.lowerBoundPtr = alloca i64
  %omp.upperBoundPtr = alloca i64
  %omp.userContext1 = bitcast i8* %omp.userContext to { i32*, i32*, i32* }*
  %0 = getelementptr inbounds { i32*, i32*, i32* }* %omp.userContext1, i32 0, i32 0
  %1 = load i32** %0
  %2 = getelementptr inbounds { i32*, i32*, i32* }* %omp.userContext1, i32 0, i32 1
  %3 = load i32** %2
  %4 = getelementptr inbounds { i32*, i32*, i32* }* %omp.userContext1, i32 0, i32 2
  %5 = load i32** %4
  br label %omp.checkNext

omp.exit:                                         ; preds = %omp.checkNext
  call void @GOMP_loop_end_nowait()
  ret void

omp.checkNext:                                    ; preds = %polly.loop_exit, %omp.setup
  %6 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr, i64* %omp.upperBoundPtr)
  %7 = icmp ne i8 %6, 0
  br i1 %7, label %omp.loadIVBounds, label %omp.exit

omp.loadIVBounds:                                 ; preds = %omp.checkNext
  %omp.lowerBound = load i64* %omp.lowerBoundPtr
  %omp.upperBound = load i64* %omp.upperBoundPtr
  %omp.upperBoundAdjusted = sub i64 %omp.upperBound, 1
  br label %polly.loop_if

polly.loop_exit:                                  ; preds = %"polly.stmt.<bb 6>", %polly.loop_if
  br label %omp.checkNext

polly.loop_if:                                    ; preds = %omp.loadIVBounds
  %polly.loop_guard = icmp sle i64 %omp.lowerBound, %omp.upperBoundAdjusted
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %polly.loop_exit

polly.loop_header:                                ; preds = %"polly.stmt.<bb 6>", %polly.loop_preheader
  %polly.indvar = phi i64 [ %omp.lowerBound, %polly.loop_preheader ], [ %polly.indvar_next, %"polly.stmt.<bb 6>" ]
  %8 = mul i64 1, %polly.indvar
  %9 = trunc i64 %8 to i32
  br label %"polly.stmt.<bb 6>"

"polly.stmt.<bb 6>":                              ; preds = %polly.loop_header
  %p_D.2736_18 = sext i32 %9 to i64
  %p_D.2737_19 = mul i64 %p_D.2736_18, 4
  %p_ = bitcast i32* %5 to i8*
  %p_pp2 = getelementptr inbounds i8* %p_, i64 %p_D.2737_19
  %p_D.2740_20 = bitcast i8* %p_pp2 to i32*
  %p_D.2736_21 = sext i32 %9 to i64
  %p_D.2737_22 = mul i64 %p_D.2736_21, 4
  %p_2 = bitcast i32* %1 to i8*
  %p_pp3 = getelementptr inbounds i8* %p_2, i64 %p_D.2737_22
  %p_D.2738_23 = bitcast i8* %p_pp3 to i32*
  %D.2741_24_p_scalar_ = load i32* %p_D.2738_23
  %p_D.2736_25 = sext i32 %9 to i64
  %p_D.2737_26 = mul i64 %p_D.2736_25, 4
  %p_3 = bitcast i32* %3 to i8*
  %p_pp4 = getelementptr inbounds i8* %p_3, i64 %p_D.2737_26
  %p_D.2739_27 = bitcast i8* %p_pp4 to i32*
  %D.2742_28_p_scalar_ = load i32* %p_D.2739_27
  %p_D.2743_29 = add nsw i32 %D.2741_24_p_scalar_, %D.2742_28_p_scalar_
  store i32 %p_D.2743_29, i32* %p_D.2740_20
  %p_i_30 = add nsw i32 %9, 1
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.adjust_ub = sub i64 %omp.upperBoundAdjusted, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.loop_if
  br label %polly.loop_header
}

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind }

!0 = metadata !{metadata !"alias set 3: int", metadata !1}
!1 = metadata !{metadata !1}
