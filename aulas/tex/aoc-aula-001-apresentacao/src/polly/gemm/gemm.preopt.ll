; ModuleID = 'gemm.s'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = call i8* @polybench_alloc_data(i64 1048576, i32 8)
  %0 = bitcast i8* %call to [1024 x [1024 x double]]*
  %call1 = call i8* @polybench_alloc_data(i64 1048576, i32 8)
  %1 = bitcast i8* %call1 to [1024 x [1024 x double]]*
  %call2 = call i8* @polybench_alloc_data(i64 1048576, i32 8)
  %2 = bitcast i8* %call2 to [1024 x [1024 x double]]*
  %arraydecay = getelementptr inbounds [1024 x [1024 x double]]* %0, i32 0, i32 0
  %arraydecay3 = getelementptr inbounds [1024 x [1024 x double]]* %1, i32 0, i32 0
  %arraydecay4 = getelementptr inbounds [1024 x [1024 x double]]* %2, i32 0, i32 0
  call void @init_array(i32 1024, i32 1024, i32 1024, double* %alpha, double* %beta, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4)
  %3 = load double* %alpha, align 8
  %4 = load double* %beta, align 8
  %arraydecay5 = getelementptr inbounds [1024 x [1024 x double]]* %0, i32 0, i32 0
  %arraydecay6 = getelementptr inbounds [1024 x [1024 x double]]* %1, i32 0, i32 0
  %arraydecay7 = getelementptr inbounds [1024 x [1024 x double]]* %2, i32 0, i32 0
  call void @kernel_gemm(i32 1024, i32 1024, i32 1024, double %3, double %4, [1024 x double]* %arraydecay5, [1024 x double]* %arraydecay6, [1024 x double]* %arraydecay7)
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i32 0
  %5 = load i8** %arrayidx, align 4
  %call8 = call i32 @strcmp(i8* %5, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #3
  %tobool = icmp ne i32 %call8, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %arraydecay9 = getelementptr inbounds [1024 x [1024 x double]]* %0, i32 0, i32 0
  call void @print_array(i32 1024, i32 1024, [1024 x double]* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %6 = bitcast [1024 x [1024 x double]]* %0 to i8*
  call void @free(i8* %6) #4
  %7 = bitcast [1024 x [1024 x double]]* %1 to i8*
  call void @free(i8* %7) #4
  %8 = bitcast [1024 x [1024 x double]]* %2 to i8*
  call void @free(i8* %8) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: nounwind
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, double* %alpha, double* %beta, [1024 x double]* %C, [1024 x double]* %A, [1024 x double]* %B) #0 {
entry:
  store double 3.241200e+04, double* %alpha, align 4
  store double 2.123000e+03, double* %beta, align 4
  %0 = icmp sgt i32 %nj, 0
  %smax7 = select i1 %0, i32 %nj, i32 0
  %1 = icmp sgt i32 %ni, 0
  %smax9 = select i1 %1, i32 %ni, i32 0
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %2 = phi i32 [ 0, %entry ], [ %inc8, %for.inc7 ]
  %exitcond10 = icmp ne i32 %2, %smax9
  br i1 %exitcond10, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %arrayidx6 = getelementptr [1024 x double]* %C, i32 %2, i32 %3
  %exitcond8 = icmp ne i32 %3, %smax7
  br i1 %exitcond8, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %conv = sitofp i32 %2 to double
  %conv4 = sitofp i32 %3 to double
  %mul = fmul double %conv, %conv4
  %conv5 = sitofp i32 %ni to double
  %div = fdiv double %mul, %conv5
  store double %div, double* %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %3, 1
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %inc8 = add nsw i32 %2, 1
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  %4 = icmp sgt i32 %nk, 0
  %smax3 = select i1 %4, i32 %nk, i32 0
  %5 = icmp sgt i32 %ni, 0
  %smax5 = select i1 %5, i32 %ni, i32 0
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc28, %for.end9
  %6 = phi i32 [ 0, %for.end9 ], [ %inc29, %for.inc28 ]
  %exitcond6 = icmp ne i32 %6, %smax5
  br i1 %exitcond6, label %for.body13, label %for.end30

for.body13:                                       ; preds = %for.cond10
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc25, %for.body13
  %7 = phi i32 [ 0, %for.body13 ], [ %inc26, %for.inc25 ]
  %arrayidx24 = getelementptr [1024 x double]* %A, i32 %6, i32 %7
  %exitcond4 = icmp ne i32 %7, %smax3
  br i1 %exitcond4, label %for.body17, label %for.end27

for.body17:                                       ; preds = %for.cond14
  %conv18 = sitofp i32 %6 to double
  %conv19 = sitofp i32 %7 to double
  %mul20 = fmul double %conv18, %conv19
  %conv21 = sitofp i32 %ni to double
  %div22 = fdiv double %mul20, %conv21
  store double %div22, double* %arrayidx24, align 4
  br label %for.inc25

for.inc25:                                        ; preds = %for.body17
  %inc26 = add nsw i32 %7, 1
  br label %for.cond14

for.end27:                                        ; preds = %for.cond14
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %inc29 = add nsw i32 %6, 1
  br label %for.cond10

for.end30:                                        ; preds = %for.cond10
  %8 = icmp sgt i32 %nj, 0
  %smax = select i1 %8, i32 %nj, i32 0
  %9 = icmp sgt i32 %nk, 0
  %smax1 = select i1 %9, i32 %nk, i32 0
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc49, %for.end30
  %10 = phi i32 [ 0, %for.end30 ], [ %inc50, %for.inc49 ]
  %exitcond2 = icmp ne i32 %10, %smax1
  br i1 %exitcond2, label %for.body34, label %for.end51

for.body34:                                       ; preds = %for.cond31
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc46, %for.body34
  %11 = phi i32 [ 0, %for.body34 ], [ %inc47, %for.inc46 ]
  %arrayidx45 = getelementptr [1024 x double]* %B, i32 %10, i32 %11
  %exitcond = icmp ne i32 %11, %smax
  br i1 %exitcond, label %for.body38, label %for.end48

for.body38:                                       ; preds = %for.cond35
  %conv39 = sitofp i32 %10 to double
  %conv40 = sitofp i32 %11 to double
  %mul41 = fmul double %conv39, %conv40
  %conv42 = sitofp i32 %ni to double
  %div43 = fdiv double %mul41, %conv42
  store double %div43, double* %arrayidx45, align 4
  br label %for.inc46

for.inc46:                                        ; preds = %for.body38
  %inc47 = add nsw i32 %11, 1
  br label %for.cond35

for.end48:                                        ; preds = %for.cond35
  br label %for.inc49

for.inc49:                                        ; preds = %for.end48
  %inc50 = add nsw i32 %10, 1
  br label %for.cond31

for.end51:                                        ; preds = %for.cond31
  ret void
}

; Function Attrs: nounwind
define internal void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [1024 x double]* %C, [1024 x double]* %A, [1024 x double]* %B) #0 {
entry:
  %0 = icmp sgt i32 %nk, 0
  %smax = select i1 %0, i32 %nk, i32 0
  %1 = icmp sgt i32 %nj, 0
  %smax1 = select i1 %1, i32 %nj, i32 0
  %2 = icmp sgt i32 %ni, 0
  %smax3 = select i1 %2, i32 %ni, i32 0
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %entry
  %3 = phi i32 [ 0, %entry ], [ %inc20, %for.inc19 ]
  %exitcond4 = icmp ne i32 %3, %smax3
  br i1 %exitcond4, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc16, %for.body
  %4 = phi i32 [ 0, %for.body ], [ %inc17, %for.inc16 ]
  %arrayidx4 = getelementptr [1024 x double]* %C, i32 %3, i32 %4
  %exitcond2 = icmp ne i32 %4, %smax1
  br i1 %exitcond2, label %for.body3, label %for.end18

for.body3:                                        ; preds = %for.cond1
  %5 = load double* %arrayidx4, align 4
  %mul = fmul double %5, %beta
  store double %mul, double* %arrayidx4, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body3
  %6 = phi i32 [ 0, %for.body3 ], [ %inc, %for.inc ]
  %arrayidx9 = getelementptr [1024 x double]* %A, i32 %3, i32 %6
  %arrayidx12 = getelementptr [1024 x double]* %B, i32 %6, i32 %4
  %exitcond = icmp ne i32 %6, %smax
  br i1 %exitcond, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %7 = load double* %arrayidx9, align 4
  %mul10 = fmul double %alpha, %7
  %8 = load double* %arrayidx12, align 4
  %mul13 = fmul double %mul10, %8
  %9 = load double* %arrayidx4, align 4
  %add = fadd double %9, %mul13
  store double %add, double* %arrayidx4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body7
  %inc = add nsw i32 %6, 1
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc16

for.inc16:                                        ; preds = %for.end
  %inc17 = add nsw i32 %4, 1
  br label %for.cond1

for.end18:                                        ; preds = %for.cond1
  br label %for.inc19

for.inc19:                                        ; preds = %for.end18
  %inc20 = add nsw i32 %3, 1
  br label %for.cond

for.end21:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind
define internal void @print_array(i32 %ni, i32 %nj, [1024 x double]* %C) #0 {
entry:
  %0 = icmp sgt i32 %nj, 0
  %smax = select i1 %0, i32 %nj, i32 0
  %1 = icmp sgt i32 %ni, 0
  %smax1 = select i1 %1, i32 %ni, i32 0
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %2 = phi i32 [ 0, %entry ], [ %inc8, %for.inc7 ]
  %3 = mul i32 %ni, %2
  %exitcond2 = icmp ne i32 %2, %smax1
  br i1 %exitcond2, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %arrayidx4 = getelementptr [1024 x double]* %C, i32 %2, i32 %4
  %add = add i32 %3, %4
  %exitcond = icmp ne i32 %4, %smax
  br i1 %exitcond, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %5 = load %struct._IO_FILE** @stderr, align 4
  %6 = load double* %arrayidx4, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %6)
  %rem = srem i32 %add, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %7 = load %struct._IO_FILE** @stderr, align 4
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %4, 1
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %inc8 = add nsw i32 %2, 1
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  %8 = load %struct._IO_FILE** @stderr, align 4
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #0

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }
attributes #4 = { nounwind }
