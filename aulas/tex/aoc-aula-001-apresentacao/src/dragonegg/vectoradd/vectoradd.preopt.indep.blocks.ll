; ModuleID = 'vectoradd.preopt.ll'
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
  %1 = load %struct._IO_FILE** @stdout, align 8
  %2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([29 x i8]* @.str, i32 0, i32 0))
  br label %3

; <label>:3                                       ; preds = %5, %0
  %indvar = phi i64 [ %indvar.next, %5 ], [ 0, %0 ]
  %exitcond = icmp ne i64 %indvar, 1024
  br i1 %exitcond, label %4, label %6

; <label>:4                                       ; preds = %3
  %scevgep1.moved.to. = getelementptr [1024 x float]* @h_a, i64 0, i64 %indvar
  %scevgep.moved.to. = getelementptr [1024 x float]* @h_b, i64 0, i64 %indvar
  store float 5.000000e-01, float* %scevgep1.moved.to., align 4
  store float 5.000000e-01, float* %scevgep.moved.to., align 4
  br label %5

; <label>:5                                       ; preds = %4
  %indvar.next = add i64 %indvar, 1
  br label %3

; <label>:6                                       ; preds = %3
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @print_array() #0 {
  %1 = load %struct._IO_FILE** @stdout, align 8
  %2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0))
  br label %3

; <label>:3                                       ; preds = %9, %0
  %indvar = phi i64 [ %indvar.next, %9 ], [ 0, %0 ]
  %i.0 = trunc i64 %indvar to i32
  %scevgep = getelementptr [1024 x float]* @h_c, i64 0, i64 %indvar
  %exitcond = icmp ne i64 %indvar, 1024
  br i1 %exitcond, label %4, label %10

; <label>:4                                       ; preds = %3
  %5 = load %struct._IO_FILE** @stdout, align 8
  %6 = load float* %scevgep, align 4
  %7 = fpext float %6 to double
  %8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([13 x i8]* @.str2, i32 0, i32 0), i32 %i.0, double %7)
  br label %9

; <label>:9                                       ; preds = %4
  %indvar.next = add i64 %indvar, 1
  br label %3

; <label>:10                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define void @check_result() #0 {
  br label %1

; <label>:1                                       ; preds = %5, %0
  %indvar = phi i64 [ %indvar.next, %5 ], [ 0, %0 ]
  %sum.0 = phi float [ 0.000000e+00, %0 ], [ %4, %5 ]
  %scevgep = getelementptr [1024 x float]* @h_c, i64 0, i64 %indvar
  %exitcond = icmp ne i64 %indvar, 1024
  br i1 %exitcond, label %2, label %6

; <label>:2                                       ; preds = %1
  %3 = load float* %scevgep, align 4
  %4 = fadd float %sum.0, %3
  br label %5

; <label>:5                                       ; preds = %2
  %indvar.next = add i64 %indvar, 1
  br label %1

; <label>:6                                       ; preds = %1
  %sum.0.lcssa = phi float [ %sum.0, %1 ]
  %7 = load %struct._IO_FILE** @stdout, align 8
  %8 = fpext float %sum.0.lcssa to double
  %9 = fdiv float %sum.0.lcssa, 1.024000e+03
  %10 = fpext float %9 to double
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([24 x i8]* @.str3, i32 0, i32 0), double %8, double %10)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  call void @init_array()
  br label %1

; <label>:1                                       ; preds = %6, %0
  %indvar = phi i64 [ %indvar.next, %6 ], [ 0, %0 ]
  %exitcond = icmp ne i64 %indvar, 1024
  br i1 %exitcond, label %2, label %7

; <label>:2                                       ; preds = %1
  %scevgep2.moved.to. = getelementptr [1024 x float]* @h_a, i64 0, i64 %indvar
  %scevgep1.moved.to. = getelementptr [1024 x float]* @h_b, i64 0, i64 %indvar
  %scevgep.moved.to. = getelementptr [1024 x float]* @h_c, i64 0, i64 %indvar
  %3 = load float* %scevgep2.moved.to., align 4
  %4 = load float* %scevgep1.moved.to., align 4
  %5 = fadd float %3, %4
  store float %5, float* %scevgep.moved.to., align 4
  br label %6

; <label>:6                                       ; preds = %2
  %indvar.next = add i64 %indvar, 1
  br label %1

; <label>:7                                       ; preds = %1
  call void @print_array()
  call void @check_result()
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 "}
