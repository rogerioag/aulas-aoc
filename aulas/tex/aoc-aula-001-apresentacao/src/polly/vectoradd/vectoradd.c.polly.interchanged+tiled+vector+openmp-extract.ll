; ModuleID = 'vectoradd.c.polly.interchanged+tiled+vector+openmp.ll'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.6.4-5) 4.6.4 LLVM: 3.3svn\22"

@.cst = linker_private constant [18 x i8] c"final result: %f\0A\00", align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture %argv) unnamed_addr #0 {
entry:
  %omp.lowerBoundPtr.i1 = alloca i64, align 8
  %omp.upperBoundPtr.i2 = alloca i64, align 8
  %omp.lowerBoundPtr.i = alloca i64, align 8
  %omp.upperBoundPtr.i = alloca i64, align 8
  %0 = call noalias i8* @malloc(i64 4096) #1
  %1 = call noalias i8* @malloc(i64 4096) #1
  %2 = call noalias i8* @malloc(i64 4096) #1
  %omp.userContext = alloca { i8*, i8* }, align 8
  %3 = getelementptr inbounds { i8*, i8* }* %omp.userContext, i64 0, i32 0
  store i8* %0, i8** %3, align 8
  %4 = getelementptr inbounds { i8*, i8* }* %omp.userContext, i64 0, i32 1
  store i8* %1, i8** %4, align 8
  %omp_data = bitcast { i8*, i8* }* %omp.userContext to i8*
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* @main.omp_subfn, i8* %omp_data, i32 0, i64 0, i64 1024, i64 1) #1
  %5 = bitcast i64* %omp.lowerBoundPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %5) #1
  %6 = bitcast i64* %omp.upperBoundPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %6) #1
  %7 = load i8** %3, align 8
  %8 = load i8** %4, align 8
  %9 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr.i, i64* %omp.upperBoundPtr.i) #1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %main.omp_subfn.exit, label %omp.loadIVBounds.i

omp.loadIVBounds.i:                               ; preds = %omp.checkNext.backedge.i, %entry
  %omp.lowerBound.i = load i64* %omp.lowerBoundPtr.i, align 8
  %omp.upperBound.i = load i64* %omp.upperBoundPtr.i, align 8
  %omp.upperBoundAdjusted.i = add i64 %omp.upperBound.i, -1
  %polly.loop_guard.i = icmp sgt i64 %omp.lowerBound.i, %omp.upperBoundAdjusted.i
  br i1 %polly.loop_guard.i, label %omp.checkNext.backedge.i, label %polly.loop_header.preheader.i

omp.checkNext.backedge.i:                         ; preds = %polly.loop_header.i, %omp.loadIVBounds.i
  %11 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr.i, i64* %omp.upperBoundPtr.i) #1
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %main.omp_subfn.exit, label %omp.loadIVBounds.i

polly.loop_header.preheader.i:                    ; preds = %omp.loadIVBounds.i
  %polly.adjust_ub.i = add i64 %omp.upperBound.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.loop_header.preheader.i
  %polly.indvar.i = phi i64 [ %polly.indvar_next.i, %polly.loop_header.i ], [ %omp.lowerBound.i, %polly.loop_header.preheader.i ]
  %p_.moved.to.3.i = trunc i64 %polly.indvar.i to i32
  %p_.moved.to.31.i = shl i64 %polly.indvar.i, 2
  %p_scevgep14.moved.to.3.i = getelementptr i8* %7, i64 %p_.moved.to.31.i
  %p_scevgep1415.moved.to.3.i = bitcast i8* %p_scevgep14.moved.to.3.i to float*
  %p_scevgep16.moved.to.3.i = getelementptr i8* %8, i64 %p_.moved.to.31.i
  %p_scevgep1617.moved.to.3.i = bitcast i8* %p_scevgep16.moved.to.3.i to float*
  %p_.i = sitofp i32 %p_.moved.to.3.i to float
  %p_2.i = call float @sinf(float %p_.i) #2
  %p_5.i = fmul float %p_2.i, %p_2.i
  store float %p_5.i, float* %p_scevgep1415.moved.to.3.i, align 4
  %p_7.i = call float @cosf(float %p_.i) #2
  %p_10.i = fmul float %p_7.i, %p_7.i
  store float %p_10.i, float* %p_scevgep1617.moved.to.3.i, align 4
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %omp.checkNext.backedge.i, label %polly.loop_header.i

main.omp_subfn.exit:                              ; preds = %omp.checkNext.backedge.i, %entry
  call void @GOMP_loop_end_nowait() #1
  call void @llvm.lifetime.end(i64 8, i8* %5) #1
  call void @llvm.lifetime.end(i64 8, i8* %6) #1
  call void @GOMP_parallel_end() #1
  %omp.userContext8 = alloca { i8*, i8*, i8* }, align 8
  %13 = getelementptr inbounds { i8*, i8*, i8* }* %omp.userContext8, i64 0, i32 0
  store i8* %0, i8** %13, align 8
  %14 = getelementptr inbounds { i8*, i8*, i8* }* %omp.userContext8, i64 0, i32 1
  store i8* %1, i8** %14, align 8
  %15 = getelementptr inbounds { i8*, i8*, i8* }* %omp.userContext8, i64 0, i32 2
  store i8* %2, i8** %15, align 8
  %omp_data9 = bitcast { i8*, i8*, i8* }* %omp.userContext8 to i8*
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* @main.omp_subfn1, i8* %omp_data9, i32 0, i64 0, i64 1024, i64 1) #1
  %16 = bitcast i64* %omp.lowerBoundPtr.i1 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %16) #1
  %17 = bitcast i64* %omp.upperBoundPtr.i2 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %17) #1
  %18 = load i8** %13, align 8
  %19 = load i8** %14, align 8
  %20 = load i8** %15, align 8
  %21 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr.i1, i64* %omp.upperBoundPtr.i2) #1
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %main.omp_subfn1.exit, label %omp.loadIVBounds.i7

omp.loadIVBounds.i7:                              ; preds = %omp.checkNext.backedge.i8, %main.omp_subfn.exit
  %omp.lowerBound.i3 = load i64* %omp.lowerBoundPtr.i1, align 8
  %omp.upperBound.i4 = load i64* %omp.upperBoundPtr.i2, align 8
  %omp.upperBoundAdjusted.i5 = add i64 %omp.upperBound.i4, -1
  %polly.loop_guard.i6 = icmp sgt i64 %omp.lowerBound.i3, %omp.upperBoundAdjusted.i5
  br i1 %polly.loop_guard.i6, label %omp.checkNext.backedge.i8, label %polly.loop_header.preheader.i10

omp.checkNext.backedge.i8:                        ; preds = %polly.loop_header.i15, %omp.loadIVBounds.i7
  %23 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr.i1, i64* %omp.upperBoundPtr.i2) #1
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %main.omp_subfn1.exit, label %omp.loadIVBounds.i7

polly.loop_header.preheader.i10:                  ; preds = %omp.loadIVBounds.i7
  %polly.adjust_ub.i9 = add i64 %omp.upperBound.i4, -2
  br label %polly.loop_header.i15

polly.loop_header.i15:                            ; preds = %polly.loop_header.i15, %polly.loop_header.preheader.i10
  %polly.indvar.i11 = phi i64 [ %polly.indvar_next.i13, %polly.loop_header.i15 ], [ %omp.lowerBound.i3, %polly.loop_header.preheader.i10 ]
  %p_.moved.to.6.i = shl i64 %polly.indvar.i11, 2
  %p_scevgep7.moved.to.6.i = getelementptr i8* %18, i64 %p_.moved.to.6.i
  %p_scevgep78.moved.to.6.i = bitcast i8* %p_scevgep7.moved.to.6.i to float*
  %p_scevgep9.moved.to.6.i = getelementptr i8* %19, i64 %p_.moved.to.6.i
  %p_scevgep910.moved.to.6.i = bitcast i8* %p_scevgep9.moved.to.6.i to float*
  %p_scevgep5.moved.to.6.i = getelementptr i8* %20, i64 %p_.moved.to.6.i
  %p_scevgep56.moved.to.6.i = bitcast i8* %p_scevgep5.moved.to.6.i to float*
  %_p_scalar_.i = load float* %p_scevgep78.moved.to.6.i, align 4
  %_p_scalar_2.i = load float* %p_scevgep910.moved.to.6.i, align 4
  %p_.i12 = fadd float %_p_scalar_.i, %_p_scalar_2.i
  store float %p_.i12, float* %p_scevgep56.moved.to.6.i, align 4
  %polly.indvar_next.i13 = add nsw i64 %polly.indvar.i11, 1
  %polly.loop_cond.i14 = icmp sgt i64 %polly.indvar.i11, %polly.adjust_ub.i9
  br i1 %polly.loop_cond.i14, label %omp.checkNext.backedge.i8, label %polly.loop_header.i15

main.omp_subfn1.exit:                             ; preds = %omp.checkNext.backedge.i8, %main.omp_subfn.exit
  call void @GOMP_loop_end_nowait() #1
  call void @llvm.lifetime.end(i64 8, i8* %16) #1
  call void @llvm.lifetime.end(i64 8, i8* %17) #1
  call void @GOMP_parallel_end() #1
  br label %"9"

"9":                                              ; preds = %"9", %main.omp_subfn1.exit
  %25 = phi float [ 0.000000e+00, %main.omp_subfn1.exit ], [ %28, %"9" ]
  %indvar16 = phi i64 [ 0, %main.omp_subfn1.exit ], [ %indvar.next, %"9" ]
  %26 = shl i64 %indvar16, 2
  %scevgep = getelementptr i8* %2, i64 %26
  %scevgep1 = bitcast i8* %scevgep to float*
  %27 = load float* %scevgep1, align 4
  %28 = fadd float %25, %27
  %indvar.next = add i64 %indvar16, 1
  %exitcond = icmp eq i64 %indvar.next, 1024
  br i1 %exitcond, label %"11", label %"9"

"11":                                             ; preds = %"9"
  %29 = fmul float %28, 9.765625e-04
  %30 = fpext float %29 to double
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.cst, i64 0, i64 0), double %30) #1
  call void @free(i8* %0) #1
  call void @free(i8* %1) #1
  call void @free(i8* %2) #1
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readnone
declare float @sinf(float) #2

; Function Attrs: nounwind readnone
declare float @cosf(float) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture, ...) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

define internal void @main.omp_subfn(i8* nocapture %omp.userContext) {
omp.setup:
  %omp.lowerBoundPtr = alloca i64, align 8
  %omp.upperBoundPtr = alloca i64, align 8
  %0 = bitcast i8* %omp.userContext to i8**
  %1 = load i8** %0, align 8
  %2 = getelementptr inbounds i8* %omp.userContext, i64 8
  %3 = bitcast i8* %2 to i8**
  %4 = load i8** %3, align 8
  %5 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr, i64* %omp.upperBoundPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %omp.exit, label %omp.loadIVBounds

omp.exit:                                         ; preds = %omp.checkNext.backedge, %omp.setup
  call void @GOMP_loop_end_nowait()
  ret void

omp.loadIVBounds:                                 ; preds = %omp.checkNext.backedge, %omp.setup
  %omp.lowerBound = load i64* %omp.lowerBoundPtr, align 8
  %omp.upperBound = load i64* %omp.upperBoundPtr, align 8
  %omp.upperBoundAdjusted = add i64 %omp.upperBound, -1
  %polly.loop_guard = icmp sgt i64 %omp.lowerBound, %omp.upperBoundAdjusted
  br i1 %polly.loop_guard, label %omp.checkNext.backedge, label %polly.loop_header.preheader

omp.checkNext.backedge:                           ; preds = %polly.loop_header, %omp.loadIVBounds
  %7 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr, i64* %omp.upperBoundPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %omp.exit, label %omp.loadIVBounds

polly.loop_header.preheader:                      ; preds = %omp.loadIVBounds
  %polly.adjust_ub = add i64 %omp.upperBound, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_header ], [ %omp.lowerBound, %polly.loop_header.preheader ]
  %p_.moved.to.3 = trunc i64 %polly.indvar to i32
  %p_.moved.to.31 = shl i64 %polly.indvar, 2
  %p_scevgep14.moved.to.3 = getelementptr i8* %1, i64 %p_.moved.to.31
  %p_scevgep1415.moved.to.3 = bitcast i8* %p_scevgep14.moved.to.3 to float*
  %p_scevgep16.moved.to.3 = getelementptr i8* %4, i64 %p_.moved.to.31
  %p_scevgep1617.moved.to.3 = bitcast i8* %p_scevgep16.moved.to.3 to float*
  %p_ = sitofp i32 %p_.moved.to.3 to float
  %p_2 = call float @sinf(float %p_) #2
  %p_5 = fmul float %p_2, %p_2
  store float %p_5, float* %p_scevgep1415.moved.to.3, align 4
  %p_7 = call float @cosf(float %p_) #2
  %p_10 = fmul float %p_7, %p_7
  store float %p_10, float* %p_scevgep1617.moved.to.3, align 4
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %omp.checkNext.backedge, label %polly.loop_header
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @main.omp_subfn1(i8* nocapture %omp.userContext) {
omp.setup:
  %omp.lowerBoundPtr = alloca i64, align 8
  %omp.upperBoundPtr = alloca i64, align 8
  %0 = bitcast i8* %omp.userContext to i8**
  %1 = load i8** %0, align 8
  %2 = getelementptr inbounds i8* %omp.userContext, i64 8
  %3 = bitcast i8* %2 to i8**
  %4 = load i8** %3, align 8
  %5 = getelementptr inbounds i8* %omp.userContext, i64 16
  %6 = bitcast i8* %5 to i8**
  %7 = load i8** %6, align 8
  %8 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr, i64* %omp.upperBoundPtr)
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %omp.exit, label %omp.loadIVBounds

omp.exit:                                         ; preds = %omp.checkNext.backedge, %omp.setup
  call void @GOMP_loop_end_nowait()
  ret void

omp.loadIVBounds:                                 ; preds = %omp.checkNext.backedge, %omp.setup
  %omp.lowerBound = load i64* %omp.lowerBoundPtr, align 8
  %omp.upperBound = load i64* %omp.upperBoundPtr, align 8
  %omp.upperBoundAdjusted = add i64 %omp.upperBound, -1
  %polly.loop_guard = icmp sgt i64 %omp.lowerBound, %omp.upperBoundAdjusted
  br i1 %polly.loop_guard, label %omp.checkNext.backedge, label %polly.loop_header.preheader

omp.checkNext.backedge:                           ; preds = %polly.loop_header, %omp.loadIVBounds
  %10 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr, i64* %omp.upperBoundPtr)
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %omp.exit, label %omp.loadIVBounds

polly.loop_header.preheader:                      ; preds = %omp.loadIVBounds
  %polly.adjust_ub = add i64 %omp.upperBound, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_header ], [ %omp.lowerBound, %polly.loop_header.preheader ]
  %p_.moved.to.6 = shl i64 %polly.indvar, 2
  %p_scevgep7.moved.to.6 = getelementptr i8* %1, i64 %p_.moved.to.6
  %p_scevgep78.moved.to.6 = bitcast i8* %p_scevgep7.moved.to.6 to float*
  %p_scevgep9.moved.to.6 = getelementptr i8* %4, i64 %p_.moved.to.6
  %p_scevgep910.moved.to.6 = bitcast i8* %p_scevgep9.moved.to.6 to float*
  %p_scevgep5.moved.to.6 = getelementptr i8* %7, i64 %p_.moved.to.6
  %p_scevgep56.moved.to.6 = bitcast i8* %p_scevgep5.moved.to.6 to float*
  %_p_scalar_ = load float* %p_scevgep78.moved.to.6, align 4
  %_p_scalar_2 = load float* %p_scevgep910.moved.to.6, align 4
  %p_ = fadd float %_p_scalar_, %_p_scalar_2
  store float %p_, float* %p_scevgep56.moved.to.6, align 4
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %omp.checkNext.backedge, label %polly.loop_header
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone }
