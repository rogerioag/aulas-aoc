; ModuleID = 'vectoradd.c.polly.interchanged+tiled.ll'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.6.4-5) 4.6.4 LLVM: 3.3svn\22"

@.cst = linker_private constant [18 x i8] c"final result: %f\0A\00", align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture %argv) unnamed_addr #0 {
entry:
  %.loc = alloca float
  %0 = tail call noalias i8* @malloc(i64 4096) #1
  %1 = tail call noalias i8* @malloc(i64 4096) #1
  %2 = tail call noalias i8* @malloc(i64 4096) #1
  br label %polly.loop_header

codeRepl:                                         ; preds = %polly.loop_header19.9_crit_edge
  call void @main_9(i8* %2, float* %.loc)
  %.reload = load float* %.loc
  br label %"11"

"11":                                             ; preds = %codeRepl
  %3 = fmul float %.reload, 9.765625e-04
  %4 = fpext float %3 to double
  %5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.cst, i64 0, i64 0), double %4) #1
  tail call void @free(i8* %0) #1
  tail call void @free(i8* %1) #1
  tail call void @free(i8* %2) #1
  ret i32 0

polly.loop_header:                                ; preds = %polly.loop_header.polly.loop_header_crit_edge, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_header.polly.loop_header_crit_edge ]
  %p_.moved.to.3 = trunc i64 %polly.indvar to i32
  %p_.moved.to.31 = shl i64 %polly.indvar, 2
  %p_scevgep14.moved.to.3 = getelementptr i8* %0, i64 %p_.moved.to.31
  %p_scevgep1415.moved.to.3 = bitcast i8* %p_scevgep14.moved.to.3 to float*
  %p_scevgep16.moved.to.3 = getelementptr i8* %1, i64 %p_.moved.to.31
  %p_scevgep1617.moved.to.3 = bitcast i8* %p_scevgep16.moved.to.3 to float*
  %p_ = sitofp i32 %p_.moved.to.3 to float
  %p_6 = tail call float @sinf(float %p_) #2
  %p_9 = fmul float %p_6, %p_6
  store float %p_9, float* %p_scevgep1415.moved.to.3, align 4
  %p_11 = tail call float @cosf(float %p_) #2
  %p_14 = fmul float %p_11, %p_11
  store float %p_14, float* %p_scevgep1617.moved.to.3, align 4
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %exitcond3 = icmp eq i64 %polly.indvar_next, 1024
  br i1 %exitcond3, label %polly.loop_header.polly.loop_header19_crit_edge, label %polly.loop_header.polly.loop_header_crit_edge

polly.loop_header.polly.loop_header_crit_edge:    ; preds = %polly.loop_header
  br label %polly.loop_header

polly.loop_header.polly.loop_header19_crit_edge:  ; preds = %polly.loop_header
  br label %polly.loop_header19

polly.loop_header19:                              ; preds = %polly.loop_header19.polly.loop_header19_crit_edge, %polly.loop_header.polly.loop_header19_crit_edge
  %polly.indvar22 = phi i64 [ %polly.indvar_next23, %polly.loop_header19.polly.loop_header19_crit_edge ], [ 0, %polly.loop_header.polly.loop_header19_crit_edge ]
  %p_.moved.to.6 = shl i64 %polly.indvar22, 2
  %p_scevgep7.moved.to.6 = getelementptr i8* %0, i64 %p_.moved.to.6
  %p_scevgep78.moved.to.6 = bitcast i8* %p_scevgep7.moved.to.6 to float*
  %p_scevgep9.moved.to.6 = getelementptr i8* %1, i64 %p_.moved.to.6
  %p_scevgep910.moved.to.6 = bitcast i8* %p_scevgep9.moved.to.6 to float*
  %p_scevgep5.moved.to.6 = getelementptr i8* %2, i64 %p_.moved.to.6
  %p_scevgep56.moved.to.6 = bitcast i8* %p_scevgep5.moved.to.6 to float*
  %_p_scalar_ = load float* %p_scevgep78.moved.to.6, align 4
  %_p_scalar_25 = load float* %p_scevgep910.moved.to.6, align 4
  %p_26 = fadd float %_p_scalar_, %_p_scalar_25
  store float %p_26, float* %p_scevgep56.moved.to.6, align 4
  %polly.indvar_next23 = add nsw i64 %polly.indvar22, 1
  %exitcond2 = icmp eq i64 %polly.indvar_next23, 1024
  br i1 %exitcond2, label %polly.loop_header19.9_crit_edge, label %polly.loop_header19.polly.loop_header19_crit_edge

polly.loop_header19.polly.loop_header19_crit_edge: ; preds = %polly.loop_header19
  br label %polly.loop_header19

polly.loop_header19.9_crit_edge:                  ; preds = %polly.loop_header19
  br label %codeRepl
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

; Function Attrs: nounwind
define internal void @main_9(i8*, float* %.out) #1 {
newFuncRoot:
  br label %"9"

"11.exitStub":                                    ; preds = %"9"
  store float %4, float* %.out
  ret void

"9":                                              ; preds = %newFuncRoot, %"9.9_crit_edge"
  %1 = phi float [ %4, %"9.9_crit_edge" ], [ 0.000000e+00, %newFuncRoot ]
  %indvar1 = phi i64 [ %indvar.next, %"9.9_crit_edge" ], [ 0, %newFuncRoot ]
  %2 = shl i64 %indvar1, 2
  %scevgep = getelementptr i8* %0, i64 %2
  %scevgep1 = bitcast i8* %scevgep to float*
  %3 = load float* %scevgep1, align 4
  %4 = fadd float %1, %3
  %indvar.next = add i64 %indvar1, 1
  %exitcond = icmp eq i64 %indvar.next, 1024
  br i1 %exitcond, label %"11.exitStub", label %"9.9_crit_edge"

"9.9_crit_edge":                                  ; preds = %"9"
  br label %"9"
}

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone }
