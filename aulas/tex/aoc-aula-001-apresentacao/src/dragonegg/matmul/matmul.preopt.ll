; ModuleID = 'matmul.s'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [1536 x [1536 x float]] zeroinitializer, align 16
@B = common global [1536 x [1536 x float]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [5 x i8] c"%lf \00", align 1
@C = common global [1536 x [1536 x float]] zeroinitializer, align 16
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 {
  br label %1

; <label>:1                                       ; preds = %20, %0
  %2 = phi i64 [ %indvar.next2, %20 ], [ 0, %0 ]
  %exitcond4 = icmp ne i64 %2, 1536
  br i1 %exitcond4, label %3, label %21

; <label>:3                                       ; preds = %1
  br label %4

; <label>:4                                       ; preds = %18, %3
  %indvar = phi i64 [ %indvar.next, %18 ], [ 0, %3 ]
  %scevgep3 = getelementptr [1536 x [1536 x float]]* @A, i64 0, i64 %2, i64 %indvar
  %scevgep = getelementptr [1536 x [1536 x float]]* @B, i64 0, i64 %2, i64 %indvar
  %5 = mul i64 %2, %indvar
  %6 = trunc i64 %5 to i32
  %exitcond = icmp ne i64 %indvar, 1536
  br i1 %exitcond, label %7, label %19

; <label>:7                                       ; preds = %4
  %8 = srem i32 %6, 1024
  %9 = add nsw i32 1, %8
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+00
  %12 = fptrunc double %11 to float
  store float %12, float* %scevgep3, align 4
  %13 = srem i32 %6, 1024
  %14 = add nsw i32 1, %13
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 2.000000e+00
  %17 = fptrunc double %16 to float
  store float %17, float* %scevgep, align 4
  br label %18

; <label>:18                                      ; preds = %7
  %indvar.next = add i64 %indvar, 1
  br label %4

; <label>:19                                      ; preds = %4
  br label %20

; <label>:20                                      ; preds = %19
  %indvar.next2 = add i64 %2, 1
  br label %1

; <label>:21                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 {
  br label %1

; <label>:1                                       ; preds = %19, %0
  %indvar1 = phi i64 [ %indvar.next2, %19 ], [ 0, %0 ]
  %exitcond3 = icmp ne i64 %indvar1, 1536
  br i1 %exitcond3, label %2, label %20

; <label>:2                                       ; preds = %1
  br label %3

; <label>:3                                       ; preds = %15, %2
  %indvar = phi i64 [ %indvar.next, %15 ], [ 0, %2 ]
  %scevgep = getelementptr [1536 x [1536 x float]]* @C, i64 0, i64 %indvar1, i64 %indvar
  %j.0 = trunc i64 %indvar to i32
  %exitcond = icmp ne i64 %indvar, 1536
  br i1 %exitcond, label %4, label %16

; <label>:4                                       ; preds = %3
  %5 = load %struct._IO_FILE** @stdout, align 8
  %6 = load float* %scevgep, align 4
  %7 = fpext float %6 to double
  %8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), double %7)
  %9 = srem i32 %j.0, 80
  %10 = icmp eq i32 %9, 79
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %4
  %12 = load %struct._IO_FILE** @stdout, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  br label %14

; <label>:14                                      ; preds = %11, %4
  br label %15

; <label>:15                                      ; preds = %14
  %indvar.next = add i64 %indvar, 1
  br label %3

; <label>:16                                      ; preds = %3
  %17 = load %struct._IO_FILE** @stdout, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  br label %19

; <label>:19                                      ; preds = %16
  %indvar.next2 = add i64 %indvar1, 1
  br label %1

; <label>:20                                      ; preds = %1
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  call void @init_array()
  br label %1

; <label>:1                                       ; preds = %16, %0
  %indvar3 = phi i64 [ %indvar.next4, %16 ], [ 0, %0 ]
  %exitcond9 = icmp ne i64 %indvar3, 1536
  br i1 %exitcond9, label %2, label %17

; <label>:2                                       ; preds = %1
  br label %3

; <label>:3                                       ; preds = %14, %2
  %indvar1 = phi i64 [ %indvar.next2, %14 ], [ 0, %2 ]
  %scevgep8 = getelementptr [1536 x [1536 x float]]* @C, i64 0, i64 %indvar3, i64 %indvar1
  %exitcond6 = icmp ne i64 %indvar1, 1536
  br i1 %exitcond6, label %4, label %15

; <label>:4                                       ; preds = %3
  store float 0.000000e+00, float* %scevgep8, align 4
  br label %5

; <label>:5                                       ; preds = %12, %4
  %indvar = phi i64 [ %indvar.next, %12 ], [ 0, %4 ]
  %scevgep5 = getelementptr [1536 x [1536 x float]]* @A, i64 0, i64 %indvar3, i64 %indvar
  %scevgep = getelementptr [1536 x [1536 x float]]* @B, i64 0, i64 %indvar, i64 %indvar1
  %exitcond = icmp ne i64 %indvar, 1536
  br i1 %exitcond, label %6, label %13

; <label>:6                                       ; preds = %5
  %7 = load float* %scevgep8, align 4
  %8 = load float* %scevgep5, align 4
  %9 = load float* %scevgep, align 4
  %10 = fmul float %8, %9
  %11 = fadd float %7, %10
  store float %11, float* %scevgep8, align 4
  br label %12

; <label>:12                                      ; preds = %6
  %indvar.next = add i64 %indvar, 1
  br label %5

; <label>:13                                      ; preds = %5
  br label %14

; <label>:14                                      ; preds = %13
  %indvar.next2 = add i64 %indvar1, 1
  br label %3

; <label>:15                                      ; preds = %3
  br label %16

; <label>:16                                      ; preds = %15
  %indvar.next4 = add i64 %indvar3, 1
  br label %1

; <label>:17                                      ; preds = %1
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Debian clang version 3.4.2-4 (tags/RELEASE_34/dot2-final) (based on LLVM 3.4.2)"}
