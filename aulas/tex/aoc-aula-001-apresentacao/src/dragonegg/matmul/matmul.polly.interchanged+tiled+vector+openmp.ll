; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [1536 x [1536 x float]] zeroinitializer, align 16
@B = common global [1536 x [1536 x float]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [5 x i8] c"%lf \00", align 1
@C = common global [1536 x [1536 x float]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @init_array() #0 {
polly.split_new_and_old:
  %omp.userContext = alloca {}, align 8
  %omp.lowerBoundPtr.i = alloca i64, align 8
  %omp.upperBoundPtr.i = alloca i64, align 8
  %omp_data = bitcast {}* %omp.userContext to i8*
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* @init_array.omp_subfn, i8* %omp_data, i32 0, i64 0, i64 1536, i64 1) #2
  %0 = bitcast i64* %omp.lowerBoundPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %0) #2
  %1 = bitcast i64* %omp.upperBoundPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %1) #2
  %2 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr.i, i64* %omp.upperBoundPtr.i) #2
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %init_array.omp_subfn.exit, label %omp.loadIVBounds.i

omp.loadIVBounds.i:                               ; preds = %polly.split_new_and_old, %omp.checkNext.backedge.i
  %omp.lowerBound.i = load i64* %omp.lowerBoundPtr.i, align 8
  %omp.upperBound.i = load i64* %omp.upperBoundPtr.i, align 8
  %omp.upperBoundAdjusted.i = add i64 %omp.upperBound.i, -1
  %polly.loop_guard.i = icmp sgt i64 %omp.lowerBound.i, %omp.upperBoundAdjusted.i
  br i1 %polly.loop_guard.i, label %omp.checkNext.backedge.i, label %polly.loop_preheader4.preheader.i

omp.checkNext.backedge.i:                         ; preds = %polly.loop_exit5.i, %omp.loadIVBounds.i
  %4 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr.i, i64* %omp.upperBoundPtr.i) #2
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %init_array.omp_subfn.exit, label %omp.loadIVBounds.i

polly.loop_preheader4.preheader.i:                ; preds = %omp.loadIVBounds.i
  %polly.adjust_ub.i = add i64 %omp.upperBound.i, -2
  br label %polly.loop_preheader4.i

polly.loop_exit5.i:                               ; preds = %polly.loop_header3.i
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %omp.checkNext.backedge.i, label %polly.loop_preheader4.i

polly.loop_header3.i:                             ; preds = %polly.loop_preheader4.i, %polly.loop_header3.i
  %polly.indvar6.i = phi i64 [ 0, %polly.loop_preheader4.i ], [ %polly.indvar_next7.i, %polly.loop_header3.i ]
  %p_.moved.to..i = mul i64 %polly.indvar6.i, %polly.indvar.i
  %p_.moved.to.1.i = trunc i64 %p_.moved.to..i to i32
  %p_scevgep3.moved.to..i = getelementptr [1536 x [1536 x float]]* @A, i64 0, i64 %polly.indvar.i, i64 %polly.indvar6.i
  %p_scevgep.moved.to..i = getelementptr [1536 x [1536 x float]]* @B, i64 0, i64 %polly.indvar.i, i64 %polly.indvar6.i
  %p_.i = srem i32 %p_.moved.to.1.i, 1024
  %p_9.i = add nsw i32 %p_.i, 1
  %p_10.i = sitofp i32 %p_9.i to double
  %p_11.i = fmul double %p_10.i, 5.000000e-01
  %p_12.i = fptrunc double %p_11.i to float
  store float %p_12.i, float* %p_scevgep3.moved.to..i, align 4
  store float %p_12.i, float* %p_scevgep.moved.to..i, align 4
  %polly.indvar_next7.i = add nsw i64 %polly.indvar6.i, 1
  %exitcond.i = icmp eq i64 %polly.indvar_next7.i, 1536
  br i1 %exitcond.i, label %polly.loop_exit5.i, label %polly.loop_header3.i

polly.loop_preheader4.i:                          ; preds = %polly.loop_exit5.i, %polly.loop_preheader4.preheader.i
  %polly.indvar.i = phi i64 [ %polly.indvar_next.i, %polly.loop_exit5.i ], [ %omp.lowerBound.i, %polly.loop_preheader4.preheader.i ]
  br label %polly.loop_header3.i

init_array.omp_subfn.exit:                        ; preds = %omp.checkNext.backedge.i, %polly.split_new_and_old
  call void @GOMP_loop_end_nowait() #2
  call void @llvm.lifetime.end(i64 8, i8* %0) #2
  call void @llvm.lifetime.end(i64 8, i8* %1) #2
  call void @GOMP_parallel_end() #2
  ret void
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 {
  br label %.preheader

.preheader:                                       ; preds = %0, %13
  %indvar15 = phi i64 [ 0, %0 ], [ %indvar.next2, %13 ]
  %1 = load %struct._IO_FILE** @stdout, align 8
  br label %2

; <label>:2                                       ; preds = %.preheader, %11
  %3 = phi %struct._IO_FILE* [ %1, %.preheader ], [ %12, %11 ]
  %indvar4 = phi i64 [ 0, %.preheader ], [ %indvar.next, %11 ]
  %j.0 = trunc i64 %indvar4 to i32
  %scevgep = getelementptr [1536 x [1536 x float]]* @C, i64 0, i64 %indvar15, i64 %indvar4
  %4 = load float* %scevgep, align 4
  %5 = fpext float %4 to double
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), double %5) #2
  %7 = srem i32 %j.0, 80
  %8 = icmp eq i32 %7, 79
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %2
  %10 = load %struct._IO_FILE** @stdout, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10)
  br label %11

; <label>:11                                      ; preds = %2, %9
  %indvar.next = add i64 %indvar4, 1
  %exitcond = icmp eq i64 %indvar.next, 1536
  %12 = load %struct._IO_FILE** @stdout, align 8
  br i1 %exitcond, label %13, label %2

; <label>:13                                      ; preds = %11
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12)
  %indvar.next2 = add i64 %indvar15, 1
  %exitcond3 = icmp eq i64 %indvar.next2, 1536
  br i1 %exitcond3, label %14, label %.preheader

; <label>:14                                      ; preds = %13
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
polly.split_new_and_old:
  %omp.userContext = alloca {}, align 8
  %omp.lowerBoundPtr.i = alloca i64, align 8
  %omp.upperBoundPtr.i = alloca i64, align 8
  call void @init_array()
  %omp_data = bitcast {}* %omp.userContext to i8*
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* @main.omp_subfn, i8* %omp_data, i32 0, i64 0, i64 1536, i64 1) #2
  %0 = bitcast i64* %omp.lowerBoundPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %0) #2
  %1 = bitcast i64* %omp.upperBoundPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %1) #2
  %2 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr.i, i64* %omp.upperBoundPtr.i) #2
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %main.omp_subfn.exit, label %omp.loadIVBounds.i

omp.loadIVBounds.i:                               ; preds = %polly.split_new_and_old, %omp.checkNext.backedge.i
  %omp.lowerBound.i = load i64* %omp.lowerBoundPtr.i, align 8
  %omp.upperBound.i = load i64* %omp.upperBoundPtr.i, align 8
  %omp.upperBoundAdjusted.i = add i64 %omp.upperBound.i, -1
  %polly.loop_guard.i = icmp sgt i64 %omp.lowerBound.i, %omp.upperBoundAdjusted.i
  br i1 %polly.loop_guard.i, label %omp.checkNext.backedge.i, label %polly.loop_preheader4.preheader.i

omp.checkNext.backedge.i:                         ; preds = %polly.loop_exit5.i, %omp.loadIVBounds.i
  %4 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr.i, i64* %omp.upperBoundPtr.i) #2
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %main.omp_subfn.exit, label %omp.loadIVBounds.i

polly.loop_preheader4.preheader.i:                ; preds = %omp.loadIVBounds.i
  %polly.adjust_ub.i = add i64 %omp.upperBound.i, -2
  br label %polly.loop_preheader4.i

polly.loop_exit5.i:                               ; preds = %polly.loop_exit12.i
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %omp.checkNext.backedge.i, label %polly.loop_preheader4.i

polly.loop_header3.i:                             ; preds = %polly.loop_preheader4.i, %polly.loop_exit12.i
  %polly.indvar6.i = phi i64 [ 0, %polly.loop_preheader4.i ], [ %polly.indvar_next7.i, %polly.loop_exit12.i ]
  %p_scevgep8.moved.to..i = getelementptr [1536 x [1536 x float]]* @C, i64 0, i64 %polly.indvar.i, i64 %polly.indvar6.i
  store float 0.000000e+00, float* %p_scevgep8.moved.to..i, align 4
  br label %polly.loop_header10.i

polly.loop_exit12.i:                              ; preds = %polly.loop_header10.i
  store float %p_19.i, float* %p_scevgep8.moved.to..i, align 4
  %polly.indvar_next7.i = add nsw i64 %polly.indvar6.i, 1
  %exitcond2.i = icmp eq i64 %polly.indvar_next7.i, 1536
  br i1 %exitcond2.i, label %polly.loop_exit5.i, label %polly.loop_header3.i

polly.loop_preheader4.i:                          ; preds = %polly.loop_exit5.i, %polly.loop_preheader4.preheader.i
  %polly.indvar.i = phi i64 [ %polly.indvar_next.i, %polly.loop_exit5.i ], [ %omp.lowerBound.i, %polly.loop_preheader4.preheader.i ]
  br label %polly.loop_header3.i

polly.loop_header10.i:                            ; preds = %polly.loop_header10.i, %polly.loop_header3.i
  %_p_scalar_1.i = phi float [ 0.000000e+00, %polly.loop_header3.i ], [ %p_19.i, %polly.loop_header10.i ]
  %polly.indvar13.i = phi i64 [ 0, %polly.loop_header3.i ], [ %polly.indvar_next14.i, %polly.loop_header10.i ]
  %p_scevgep5.moved.to..i = getelementptr [1536 x [1536 x float]]* @A, i64 0, i64 %polly.indvar.i, i64 %polly.indvar13.i
  %p_scevgep.moved.to..i = getelementptr [1536 x [1536 x float]]* @B, i64 0, i64 %polly.indvar13.i, i64 %polly.indvar6.i
  %_p_scalar_17.i = load float* %p_scevgep5.moved.to..i, align 4
  %_p_scalar_18.i = load float* %p_scevgep.moved.to..i, align 4
  %p_.i = fmul float %_p_scalar_17.i, %_p_scalar_18.i
  %p_19.i = fadd float %_p_scalar_1.i, %p_.i
  %polly.indvar_next14.i = add nsw i64 %polly.indvar13.i, 1
  %exitcond.i = icmp eq i64 %polly.indvar_next14.i, 1536
  br i1 %exitcond.i, label %polly.loop_exit12.i, label %polly.loop_header10.i

main.omp_subfn.exit:                              ; preds = %omp.checkNext.backedge.i, %polly.split_new_and_old
  call void @GOMP_loop_end_nowait() #2
  call void @llvm.lifetime.end(i64 8, i8* %0) #2
  call void @llvm.lifetime.end(i64 8, i8* %1) #2
  call void @GOMP_parallel_end() #2
  ret i32 0
}

define internal void @init_array.omp_subfn(i8* nocapture readnone %omp.userContext) {
omp.setup:
  %omp.lowerBoundPtr = alloca i64, align 8
  %omp.upperBoundPtr = alloca i64, align 8
  %0 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr, i64* %omp.upperBoundPtr)
  %1 = icmp eq i8 %0, 0
  br i1 %1, label %omp.exit, label %omp.loadIVBounds

omp.exit:                                         ; preds = %omp.checkNext.backedge, %omp.setup
  call void @GOMP_loop_end_nowait()
  ret void

omp.loadIVBounds:                                 ; preds = %omp.setup, %omp.checkNext.backedge
  %omp.lowerBound = load i64* %omp.lowerBoundPtr, align 8
  %omp.upperBound = load i64* %omp.upperBoundPtr, align 8
  %omp.upperBoundAdjusted = add i64 %omp.upperBound, -1
  %polly.loop_guard = icmp sgt i64 %omp.lowerBound, %omp.upperBoundAdjusted
  br i1 %polly.loop_guard, label %omp.checkNext.backedge, label %polly.loop_preheader4.preheader

omp.checkNext.backedge:                           ; preds = %polly.loop_exit5, %omp.loadIVBounds
  %2 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr, i64* %omp.upperBoundPtr)
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %omp.exit, label %omp.loadIVBounds

polly.loop_preheader4.preheader:                  ; preds = %omp.loadIVBounds
  %polly.adjust_ub = add i64 %omp.upperBound, -2
  br label %polly.loop_preheader4

polly.loop_exit5:                                 ; preds = %polly.loop_header3
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %omp.checkNext.backedge, label %polly.loop_preheader4

polly.loop_header3:                               ; preds = %polly.loop_header3, %polly.loop_preheader4
  %polly.indvar6 = phi i64 [ 0, %polly.loop_preheader4 ], [ %polly.indvar_next7, %polly.loop_header3 ]
  %p_.moved.to. = mul i64 %polly.indvar6, %polly.indvar
  %p_.moved.to.1 = trunc i64 %p_.moved.to. to i32
  %p_scevgep3.moved.to. = getelementptr [1536 x [1536 x float]]* @A, i64 0, i64 %polly.indvar, i64 %polly.indvar6
  %p_scevgep.moved.to. = getelementptr [1536 x [1536 x float]]* @B, i64 0, i64 %polly.indvar, i64 %polly.indvar6
  %p_ = srem i32 %p_.moved.to.1, 1024
  %p_9 = add nsw i32 %p_, 1
  %p_10 = sitofp i32 %p_9 to double
  %p_11 = fmul double %p_10, 5.000000e-01
  %p_12 = fptrunc double %p_11 to float
  store float %p_12, float* %p_scevgep3.moved.to., align 4
  store float %p_12, float* %p_scevgep.moved.to., align 4
  %polly.indvar_next7 = add nsw i64 %polly.indvar6, 1
  %exitcond = icmp eq i64 %polly.indvar_next7, 1536
  br i1 %exitcond, label %polly.loop_exit5, label %polly.loop_header3

polly.loop_preheader4:                            ; preds = %polly.loop_preheader4.preheader, %polly.loop_exit5
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit5 ], [ %omp.lowerBound, %polly.loop_preheader4.preheader ]
  br label %polly.loop_header3
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @main.omp_subfn(i8* nocapture readnone %omp.userContext) {
omp.setup:
  %omp.lowerBoundPtr = alloca i64, align 8
  %omp.upperBoundPtr = alloca i64, align 8
  %0 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr, i64* %omp.upperBoundPtr)
  %1 = icmp eq i8 %0, 0
  br i1 %1, label %omp.exit, label %omp.loadIVBounds

omp.exit:                                         ; preds = %omp.checkNext.backedge, %omp.setup
  call void @GOMP_loop_end_nowait()
  ret void

omp.loadIVBounds:                                 ; preds = %omp.setup, %omp.checkNext.backedge
  %omp.lowerBound = load i64* %omp.lowerBoundPtr, align 8
  %omp.upperBound = load i64* %omp.upperBoundPtr, align 8
  %omp.upperBoundAdjusted = add i64 %omp.upperBound, -1
  %polly.loop_guard = icmp sgt i64 %omp.lowerBound, %omp.upperBoundAdjusted
  br i1 %polly.loop_guard, label %omp.checkNext.backedge, label %polly.loop_preheader4.preheader

omp.checkNext.backedge:                           ; preds = %polly.loop_exit5, %omp.loadIVBounds
  %2 = call i8 @GOMP_loop_runtime_next(i64* %omp.lowerBoundPtr, i64* %omp.upperBoundPtr)
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %omp.exit, label %omp.loadIVBounds

polly.loop_preheader4.preheader:                  ; preds = %omp.loadIVBounds
  %polly.adjust_ub = add i64 %omp.upperBound, -2
  br label %polly.loop_preheader4

polly.loop_exit5:                                 ; preds = %polly.loop_exit12
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %omp.checkNext.backedge, label %polly.loop_preheader4

polly.loop_header3:                               ; preds = %polly.loop_exit12, %polly.loop_preheader4
  %polly.indvar6 = phi i64 [ 0, %polly.loop_preheader4 ], [ %polly.indvar_next7, %polly.loop_exit12 ]
  %p_scevgep8.moved.to. = getelementptr [1536 x [1536 x float]]* @C, i64 0, i64 %polly.indvar, i64 %polly.indvar6
  store float 0.000000e+00, float* %p_scevgep8.moved.to., align 4
  br label %polly.loop_header10

polly.loop_exit12:                                ; preds = %polly.loop_header10
  store float %p_19, float* %p_scevgep8.moved.to., align 4
  %polly.indvar_next7 = add nsw i64 %polly.indvar6, 1
  %exitcond2 = icmp eq i64 %polly.indvar_next7, 1536
  br i1 %exitcond2, label %polly.loop_exit5, label %polly.loop_header3

polly.loop_preheader4:                            ; preds = %polly.loop_preheader4.preheader, %polly.loop_exit5
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit5 ], [ %omp.lowerBound, %polly.loop_preheader4.preheader ]
  br label %polly.loop_header3

polly.loop_header10:                              ; preds = %polly.loop_header10, %polly.loop_header3
  %_p_scalar_1 = phi float [ 0.000000e+00, %polly.loop_header3 ], [ %p_19, %polly.loop_header10 ]
  %polly.indvar13 = phi i64 [ 0, %polly.loop_header3 ], [ %polly.indvar_next14, %polly.loop_header10 ]
  %p_scevgep5.moved.to. = getelementptr [1536 x [1536 x float]]* @A, i64 0, i64 %polly.indvar, i64 %polly.indvar13
  %p_scevgep.moved.to. = getelementptr [1536 x [1536 x float]]* @B, i64 0, i64 %polly.indvar13, i64 %polly.indvar6
  %_p_scalar_17 = load float* %p_scevgep5.moved.to., align 4
  %_p_scalar_18 = load float* %p_scevgep.moved.to., align 4
  %p_ = fmul float %_p_scalar_17, %_p_scalar_18
  %p_19 = fadd float %_p_scalar_1, %p_
  %polly.indvar_next14 = add nsw i64 %polly.indvar13, 1
  %exitcond = icmp eq i64 %polly.indvar_next14, 1536
  br i1 %exitcond, label %polly.loop_exit12, label %polly.loop_header10
}

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Debian clang version 3.4.2-4 (tags/RELEASE_34/dot2-final) (based on LLVM 3.4.2)"}
