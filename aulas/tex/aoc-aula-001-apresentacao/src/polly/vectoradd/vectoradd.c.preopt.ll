; ModuleID = 'vectoradd.c.ir.s'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.6.4-5) 4.6.4 LLVM: 3.3svn\22"

@.cst = linker_private constant [18 x i8] c"final result: %f\0A\00", align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) unnamed_addr #0 {
entry:
  %"alloca point" = bitcast i32 0 to i32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %0 = call noalias i8* @malloc(i64 4096) #1
  %1 = call noalias i8* @malloc(i64 4096) #1
  %2 = call noalias i8* @malloc(i64 4096) #1
  br label %"4"

"3":                                              ; preds = %"4"
  %3 = sitofp i32 %13 to float
  %4 = call float @sinf(float %3) #2
  %5 = sitofp i32 %13 to float
  %6 = call float @sinf(float %5) #2
  %7 = fmul float %4, %6
  store float %7, float* %scevgep1415, align 4
  %8 = sitofp i32 %13 to float
  %9 = call float @cosf(float %8) #2
  %10 = sitofp i32 %13 to float
  %11 = call float @cosf(float %10) #2
  %12 = fmul float %9, %11
  store float %12, float* %scevgep1617, align 4
  %indvar.next12 = add i64 %indvar11, 1
  br label %"4"

"4":                                              ; preds = %"3", %"2"
  %indvar11 = phi i64 [ %indvar.next12, %"3" ], [ 0, %"2" ]
  %13 = trunc i64 %indvar11 to i32
  %14 = mul i64 %indvar11, 4
  %scevgep14 = getelementptr i8* %0, i64 %14
  %scevgep1415 = bitcast i8* %scevgep14 to float*
  %scevgep16 = getelementptr i8* %1, i64 %14
  %scevgep1617 = bitcast i8* %scevgep16 to float*
  %exitcond13 = icmp ne i64 %indvar11, 1024
  br i1 %exitcond13, label %"3", label %"5"

"5":                                              ; preds = %"4"
  %15 = bitcast i8* %0 to float*
  %16 = bitcast i8* %1 to float*
  %17 = bitcast i8* %2 to float*
  br label %"7"

"6":                                              ; preds = %"7"
  %18 = load float* %scevgep78, align 4
  %19 = load float* %scevgep910, align 4
  %20 = fadd float %18, %19
  store float %20, float* %scevgep56, align 4
  %indvar.next3 = add i64 %indvar2, 1
  br label %"7"

"7":                                              ; preds = %"6", %"5"
  %indvar2 = phi i64 [ %indvar.next3, %"6" ], [ 0, %"5" ]
  %21 = mul i64 %indvar2, 4
  %scevgep5 = getelementptr i8* %2, i64 %21
  %scevgep56 = bitcast i8* %scevgep5 to float*
  %scevgep7 = getelementptr i8* %0, i64 %21
  %scevgep78 = bitcast i8* %scevgep7 to float*
  %scevgep9 = getelementptr i8* %1, i64 %21
  %scevgep910 = bitcast i8* %scevgep9 to float*
  %exitcond4 = icmp ne i64 %indvar2, 1024
  br i1 %exitcond4, label %"6", label %"8"

"8":                                              ; preds = %"7"
  br label %"10"

"9":                                              ; preds = %"10"
  %22 = load float* %scevgep1, align 4
  %23 = fadd float %22, %24
  %indvar.next = add i64 %indvar, 1
  br label %"10"

"10":                                             ; preds = %"9", %"8"
  %indvar = phi i64 [ %indvar.next, %"9" ], [ 0, %"8" ]
  %24 = phi float [ %23, %"9" ], [ 0.000000e+00, %"8" ]
  %25 = mul i64 %indvar, 4
  %scevgep = getelementptr i8* %2, i64 %25
  %scevgep1 = bitcast i8* %scevgep to float*
  %exitcond = icmp ne i64 %indvar, 1024
  br i1 %exitcond, label %"9", label %"11"

"11":                                             ; preds = %"10"
  %.lcssa = phi float [ %24, %"10" ]
  %26 = fdiv float %.lcssa, 1.024000e+03
  %27 = fpext float %26 to double
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.cst, i64 0, i64 0), double %27) #1
  %29 = bitcast float* %15 to i8*
  call void @free(i8* %29) #1
  %30 = bitcast float* %16 to i8*
  call void @free(i8* %30) #1
  %31 = bitcast float* %17 to i8*
  call void @free(i8* %31) #1
  br label %return

return:                                           ; preds = %"11"
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readnone
declare float @sinf(float) #2

; Function Attrs: nounwind readnone
declare float @cosf(float) #2

declare i32 @printf(i8*, ...)

; Function Attrs: nounwind
declare void @free(i8*) #1

attributes #0 = { nounwind uwtable }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone }
