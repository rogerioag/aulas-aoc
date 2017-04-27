; ModuleID = 'vectoradd.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdout = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [29 x i8] c"Initialize vectors on host:\0A\00", align 1
@h_a = common global [1024 x float] zeroinitializer, align 16
@h_b = common global [1024 x float] zeroinitializer, align 16
@.str1 = private unnamed_addr constant [29 x i8] c"Printing the vector result:\0A\00", align 1
@.str2 = private unnamed_addr constant [13 x i8] c"h_c[%d]: %f\0A\00", align 1
@h_c = common global [1024 x float] zeroinitializer, align 16
@.str3 = private unnamed_addr constant [24 x i8] c"Final Result: (%f, %f)\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 {
  %i = alloca i32, align 4
  %1 = load %struct._IO_FILE** @stdout, align 8
  %2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([29 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 1024
  br i1 %5, label %6, label %16

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [1024 x float]* @h_a, i32 0, i64 %8
  store float 5.000000e-01, float* %9, align 4
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [1024 x float]* @h_b, i32 0, i64 %11
  store float 5.000000e-01, float* %12, align 4
  br label %13

; <label>:13                                      ; preds = %6
  %14 = load i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %3

; <label>:16                                      ; preds = %3
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @print_array() #0 {
  %i = alloca i32, align 4
  %1 = load %struct._IO_FILE** @stdout, align 8
  %2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %15, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 1024
  br i1 %5, label %6, label %18

; <label>:6                                       ; preds = %3
  %7 = load %struct._IO_FILE** @stdout, align 8
  %8 = load i32* %i, align 4
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [1024 x float]* @h_c, i32 0, i64 %10
  %12 = load float* %11, align 4
  %13 = fpext float %12 to double
  %14 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0), i32 %8, double %13)
  br label %15

; <label>:15                                      ; preds = %6
  %16 = load i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %3

; <label>:18                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define void @check_result() #0 {
  %i = alloca i32, align 4
  %sum = alloca float, align 4
  store float 0.000000e+00, float* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 1024
  br i1 %3, label %4, label %14

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [1024 x float]* @h_c, i32 0, i64 %6
  %8 = load float* %7, align 4
  %9 = load float* %sum, align 4
  %10 = fadd float %9, %8
  store float %10, float* %sum, align 4
  br label %11

; <label>:11                                      ; preds = %4
  %12 = load i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %1

; <label>:14                                      ; preds = %1
  %15 = load %struct._IO_FILE** @stdout, align 8
  %16 = load float* %sum, align 4
  %17 = fpext float %16 to double
  %18 = load float* %sum, align 4
  %19 = fdiv float %18, 1.024000e+03
  %20 = fpext float %19 to double
  %21 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([24 x i8]* @.str3, i32 0, i32 0), double %17, double %20)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  call void @init_array()
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %18, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 1024
  br i1 %4, label %5, label %21

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [1024 x float]* @h_a, i32 0, i64 %7
  %9 = load float* %8, align 4
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [1024 x float]* @h_b, i32 0, i64 %11
  %13 = load float* %12, align 4
  %14 = fadd float %9, %13
  %15 = load i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [1024 x float]* @h_c, i32 0, i64 %16
  store float %14, float* %17, align 4
  br label %18

; <label>:18                                      ; preds = %5
  %19 = load i32* %i, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %2

; <label>:21                                      ; preds = %2
  call void @print_array()
  call void @check_result()
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 "}
