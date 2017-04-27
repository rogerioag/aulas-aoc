; ModuleID = 'vectoradd-with-function.c.normalopt.ll'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.6.4-5) 4.6.4 LLVM: 3.3svn\22"

@c = common unnamed_addr global float* null
@b = common unnamed_addr global float* null
@a = common unnamed_addr global float* null
@.cst = linker_private constant [18 x i8] c"final result: %f\0A\00", align 8

; Function Attrs: nounwind uwtable
define void @vectorAdd(...) #0 {
entry:
  br label %"3"

"3":                                              ; preds = %"3.3_crit_edge", %entry
  %indvar1 = phi i64 [ 0, %entry ], [ %indvar.next, %"3.3_crit_edge" ]
  %0 = load float** @c, align 8
  %1 = load float** @a, align 8
  %scevgep1 = getelementptr float* %1, i64 %indvar1
  %2 = load float* %scevgep1, align 4
  %3 = load float** @b, align 8
  %scevgep2 = getelementptr float* %3, i64 %indvar1
  %4 = load float* %scevgep2, align 4
  %5 = fadd float %2, %4
  %scevgep = getelementptr float* %0, i64 %indvar1
  store float %5, float* %scevgep, align 4
  %indvar.next = add i64 %indvar1, 1
  %exitcond = icmp eq i64 %indvar.next, 1024
  br i1 %exitcond, label %return, label %"3.3_crit_edge"

"3.3_crit_edge":                                  ; preds = %"3"
  br label %"3"

return:                                           ; preds = %"3"
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture %argv) unnamed_addr #0 {
entry:
  %.loc = alloca float
  %0 = tail call noalias i8* @malloc(i64 4096) #1
  %1 = bitcast i8* %0 to float*
  store float* %1, float** @a, align 8
  %2 = tail call noalias i8* @malloc(i64 4096) #1
  %3 = bitcast i8* %2 to float*
  store float* %3, float** @b, align 8
  %4 = tail call noalias i8* @malloc(i64 4096) #1
  %5 = bitcast i8* %4 to float*
  store float* %5, float** @c, align 8
  br label %codeRepl1

codeRepl1:                                        ; preds = %entry
  call void @main_3(float* %1)
  br label %"5"

"5":                                              ; preds = %codeRepl1
  tail call void (...)* @vectorAdd() #0
  %6 = load float** @c, align 8
  br label %codeRepl

codeRepl:                                         ; preds = %"5"
  call void @main_6(float* %6, float* %.loc)
  %.reload = load float* %.loc
  br label %"8"

"8":                                              ; preds = %codeRepl
  %7 = fmul float %.reload, 9.765625e-04
  %8 = fpext float %7 to double
  %9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.cst, i64 0, i64 0), double %8) #1
  %10 = load float** @a, align 8
  %11 = bitcast float* %10 to i8*
  tail call void @free(i8* %11) #1
  %12 = load float** @b, align 8
  %13 = bitcast float* %12 to i8*
  tail call void @free(i8* %13) #1
  %14 = load float** @c, align 8
  %15 = bitcast float* %14 to i8*
  tail call void @free(i8* %15) #1
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

; Function Attrs: nounwind
define internal void @main_6(float*, float* %.out) #1 {
newFuncRoot:
  br label %"6"

"8.exitStub":                                     ; preds = %"6"
  store float %3, float* %.out
  ret void

"6":                                              ; preds = %newFuncRoot, %"6.6_crit_edge"
  %1 = phi float [ 0.000000e+00, %newFuncRoot ], [ %3, %"6.6_crit_edge" ]
  %indvar2 = phi i64 [ 0, %newFuncRoot ], [ %indvar.next, %"6.6_crit_edge" ]
  %scevgep = getelementptr float* %0, i64 %indvar2
  %2 = load float* %scevgep, align 4
  %3 = fadd float %1, %2
  %indvar.next = add i64 %indvar2, 1
  %exitcond = icmp eq i64 %indvar.next, 1024
  br i1 %exitcond, label %"8.exitStub", label %"6.6_crit_edge"

"6.6_crit_edge":                                  ; preds = %"6"
  br label %"6"
}

; Function Attrs: nounwind
define internal void @main_3(float*) #1 {
newFuncRoot:
  br label %"3"

"5.exitStub":                                     ; preds = %"3"
  ret void

"3":                                              ; preds = %newFuncRoot, %"3.3_crit_edge"
  %1 = phi float* [ %0, %newFuncRoot ], [ %.pre, %"3.3_crit_edge" ]
  %indvar13 = phi i64 [ 0, %newFuncRoot ], [ %indvar.next2, %"3.3_crit_edge" ]
  %2 = trunc i64 %indvar13 to i32
  %3 = sitofp i32 %2 to float
  %4 = tail call float @sinf(float %3) #2
  %5 = fmul float %4, %4
  %scevgep4 = getelementptr float* %1, i64 %indvar13
  store float %5, float* %scevgep4, align 4
  %6 = load float** @b, align 8
  %7 = tail call float @cosf(float %3) #2
  %8 = fmul float %7, %7
  %scevgep5 = getelementptr float* %6, i64 %indvar13
  store float %8, float* %scevgep5, align 4
  %indvar.next2 = add i64 %indvar13, 1
  %exitcond3 = icmp eq i64 %indvar.next2, 1024
  br i1 %exitcond3, label %"5.exitStub", label %"3.3_crit_edge"

"3.3_crit_edge":                                  ; preds = %"3"
  %.pre = load float** @a, align 8
  br label %"3"
}

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone }
