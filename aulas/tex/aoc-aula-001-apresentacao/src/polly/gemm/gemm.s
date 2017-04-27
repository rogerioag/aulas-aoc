; ModuleID = 'gemm.c'
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
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 4
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %C = alloca [1024 x [1024 x double]]*, align 4
  %A = alloca [1024 x [1024 x double]]*, align 4
  %B = alloca [1024 x [1024 x double]]*, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 4
  store i32 1024, i32* %ni, align 4
  store i32 1024, i32* %nj, align 4
  store i32 1024, i32* %nk, align 4
  %call = call i8* @polybench_alloc_data(i64 1048576, i32 8)
  %0 = bitcast i8* %call to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %0, [1024 x [1024 x double]]** %C, align 4
  %call1 = call i8* @polybench_alloc_data(i64 1048576, i32 8)
  %1 = bitcast i8* %call1 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %1, [1024 x [1024 x double]]** %A, align 4
  %call2 = call i8* @polybench_alloc_data(i64 1048576, i32 8)
  %2 = bitcast i8* %call2 to [1024 x [1024 x double]]*
  store [1024 x [1024 x double]]* %2, [1024 x [1024 x double]]** %B, align 4
  %3 = load i32* %ni, align 4
  %4 = load i32* %nj, align 4
  %5 = load i32* %nk, align 4
  %6 = load [1024 x [1024 x double]]** %C, align 4
  %arraydecay = getelementptr inbounds [1024 x [1024 x double]]* %6, i32 0, i32 0
  %7 = load [1024 x [1024 x double]]** %A, align 4
  %arraydecay3 = getelementptr inbounds [1024 x [1024 x double]]* %7, i32 0, i32 0
  %8 = load [1024 x [1024 x double]]** %B, align 4
  %arraydecay4 = getelementptr inbounds [1024 x [1024 x double]]* %8, i32 0, i32 0
  call void @init_array(i32 %3, i32 %4, i32 %5, double* %alpha, double* %beta, [1024 x double]* %arraydecay, [1024 x double]* %arraydecay3, [1024 x double]* %arraydecay4)
  %9 = load i32* %ni, align 4
  %10 = load i32* %nj, align 4
  %11 = load i32* %nk, align 4
  %12 = load double* %alpha, align 8
  %13 = load double* %beta, align 8
  %14 = load [1024 x [1024 x double]]** %C, align 4
  %arraydecay5 = getelementptr inbounds [1024 x [1024 x double]]* %14, i32 0, i32 0
  %15 = load [1024 x [1024 x double]]** %A, align 4
  %arraydecay6 = getelementptr inbounds [1024 x [1024 x double]]* %15, i32 0, i32 0
  %16 = load [1024 x [1024 x double]]** %B, align 4
  %arraydecay7 = getelementptr inbounds [1024 x [1024 x double]]* %16, i32 0, i32 0
  call void @kernel_gemm(i32 %9, i32 %10, i32 %11, double %12, double %13, [1024 x double]* %arraydecay5, [1024 x double]* %arraydecay6, [1024 x double]* %arraydecay7)
  %17 = load i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %17, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %18 = load i8*** %argv.addr, align 4
  %arrayidx = getelementptr inbounds i8** %18, i32 0
  %19 = load i8** %arrayidx, align 4
  %call8 = call i32 @strcmp(i8* %19, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) #3
  %tobool = icmp ne i32 %call8, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %20 = load i32* %ni, align 4
  %21 = load i32* %nj, align 4
  %22 = load [1024 x [1024 x double]]** %C, align 4
  %arraydecay9 = getelementptr inbounds [1024 x [1024 x double]]* %22, i32 0, i32 0
  call void @print_array(i32 %20, i32 %21, [1024 x double]* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %23 = load [1024 x [1024 x double]]** %C, align 4
  %24 = bitcast [1024 x [1024 x double]]* %23 to i8*
  call void @free(i8* %24) #4
  %25 = load [1024 x [1024 x double]]** %A, align 4
  %26 = bitcast [1024 x [1024 x double]]* %25 to i8*
  call void @free(i8* %26) #4
  %27 = load [1024 x [1024 x double]]** %B, align 4
  %28 = bitcast [1024 x [1024 x double]]* %27 to i8*
  call void @free(i8* %28) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: nounwind
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, double* %alpha, double* %beta, [1024 x double]* %C, [1024 x double]* %A, [1024 x double]* %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 4
  %beta.addr = alloca double*, align 4
  %C.addr = alloca [1024 x double]*, align 4
  %A.addr = alloca [1024 x double]*, align 4
  %B.addr = alloca [1024 x double]*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nj, i32* %nj.addr, align 4
  store i32 %nk, i32* %nk.addr, align 4
  store double* %alpha, double** %alpha.addr, align 4
  store double* %beta, double** %beta.addr, align 4
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 4
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 4
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 4
  %0 = load double** %alpha.addr, align 4
  store double 3.241200e+04, double* %0, align 4
  %1 = load double** %beta.addr, align 4
  store double 2.123000e+03, double* %1, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %2 = load i32* %i, align 4
  %3 = load i32* %ni.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32* %j, align 4
  %5 = load i32* %nj.addr, align 4
  %cmp2 = icmp slt i32 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %i, align 4
  %conv = sitofp i32 %6 to double
  %7 = load i32* %j, align 4
  %conv4 = sitofp i32 %7 to double
  %mul = fmul double %conv, %conv4
  %8 = load i32* %ni.addr, align 4
  %conv5 = sitofp i32 %8 to double
  %div = fdiv double %mul, %conv5
  %9 = load i32* %j, align 4
  %10 = load i32* %i, align 4
  %11 = load [1024 x double]** %C.addr, align 4
  %arrayidx = getelementptr inbounds [1024 x double]* %11, i32 %10
  %arrayidx6 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i32 %9
  store double %div, double* %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %12 = load i32* %j, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %13 = load i32* %i, align 4
  %inc8 = add nsw i32 %13, 1
  store i32 %inc8, i32* %i, align 4
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc28, %for.end9
  %14 = load i32* %i, align 4
  %15 = load i32* %ni.addr, align 4
  %cmp11 = icmp slt i32 %14, %15
  br i1 %cmp11, label %for.body13, label %for.end30

for.body13:                                       ; preds = %for.cond10
  store i32 0, i32* %j, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc25, %for.body13
  %16 = load i32* %j, align 4
  %17 = load i32* %nk.addr, align 4
  %cmp15 = icmp slt i32 %16, %17
  br i1 %cmp15, label %for.body17, label %for.end27

for.body17:                                       ; preds = %for.cond14
  %18 = load i32* %i, align 4
  %conv18 = sitofp i32 %18 to double
  %19 = load i32* %j, align 4
  %conv19 = sitofp i32 %19 to double
  %mul20 = fmul double %conv18, %conv19
  %20 = load i32* %ni.addr, align 4
  %conv21 = sitofp i32 %20 to double
  %div22 = fdiv double %mul20, %conv21
  %21 = load i32* %j, align 4
  %22 = load i32* %i, align 4
  %23 = load [1024 x double]** %A.addr, align 4
  %arrayidx23 = getelementptr inbounds [1024 x double]* %23, i32 %22
  %arrayidx24 = getelementptr inbounds [1024 x double]* %arrayidx23, i32 0, i32 %21
  store double %div22, double* %arrayidx24, align 4
  br label %for.inc25

for.inc25:                                        ; preds = %for.body17
  %24 = load i32* %j, align 4
  %inc26 = add nsw i32 %24, 1
  store i32 %inc26, i32* %j, align 4
  br label %for.cond14

for.end27:                                        ; preds = %for.cond14
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %25 = load i32* %i, align 4
  %inc29 = add nsw i32 %25, 1
  store i32 %inc29, i32* %i, align 4
  br label %for.cond10

for.end30:                                        ; preds = %for.cond10
  store i32 0, i32* %i, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc49, %for.end30
  %26 = load i32* %i, align 4
  %27 = load i32* %nk.addr, align 4
  %cmp32 = icmp slt i32 %26, %27
  br i1 %cmp32, label %for.body34, label %for.end51

for.body34:                                       ; preds = %for.cond31
  store i32 0, i32* %j, align 4
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc46, %for.body34
  %28 = load i32* %j, align 4
  %29 = load i32* %nj.addr, align 4
  %cmp36 = icmp slt i32 %28, %29
  br i1 %cmp36, label %for.body38, label %for.end48

for.body38:                                       ; preds = %for.cond35
  %30 = load i32* %i, align 4
  %conv39 = sitofp i32 %30 to double
  %31 = load i32* %j, align 4
  %conv40 = sitofp i32 %31 to double
  %mul41 = fmul double %conv39, %conv40
  %32 = load i32* %ni.addr, align 4
  %conv42 = sitofp i32 %32 to double
  %div43 = fdiv double %mul41, %conv42
  %33 = load i32* %j, align 4
  %34 = load i32* %i, align 4
  %35 = load [1024 x double]** %B.addr, align 4
  %arrayidx44 = getelementptr inbounds [1024 x double]* %35, i32 %34
  %arrayidx45 = getelementptr inbounds [1024 x double]* %arrayidx44, i32 0, i32 %33
  store double %div43, double* %arrayidx45, align 4
  br label %for.inc46

for.inc46:                                        ; preds = %for.body38
  %36 = load i32* %j, align 4
  %inc47 = add nsw i32 %36, 1
  store i32 %inc47, i32* %j, align 4
  br label %for.cond35

for.end48:                                        ; preds = %for.cond35
  br label %for.inc49

for.inc49:                                        ; preds = %for.end48
  %37 = load i32* %i, align 4
  %inc50 = add nsw i32 %37, 1
  store i32 %inc50, i32* %i, align 4
  br label %for.cond31

for.end51:                                        ; preds = %for.cond31
  ret void
}

; Function Attrs: nounwind
define internal void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [1024 x double]* %C, [1024 x double]* %A, [1024 x double]* %B) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %C.addr = alloca [1024 x double]*, align 4
  %A.addr = alloca [1024 x double]*, align 4
  %B.addr = alloca [1024 x double]*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nj, i32* %nj.addr, align 4
  store i32 %nk, i32* %nk.addr, align 4
  store double %alpha, double* %alpha.addr, align 8
  store double %beta, double* %beta.addr, align 8
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 4
  store [1024 x double]* %A, [1024 x double]** %A.addr, align 4
  store [1024 x double]* %B, [1024 x double]** %B.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %ni.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc16, %for.body
  %2 = load i32* %j, align 4
  %3 = load i32* %nj.addr, align 4
  %cmp2 = icmp slt i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end18

for.body3:                                        ; preds = %for.cond1
  %4 = load double* %beta.addr, align 8
  %5 = load i32* %j, align 4
  %6 = load i32* %i, align 4
  %7 = load [1024 x double]** %C.addr, align 4
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i32 %6
  %arrayidx4 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i32 %5
  %8 = load double* %arrayidx4, align 4
  %mul = fmul double %8, %4
  store double %mul, double* %arrayidx4, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body3
  %9 = load i32* %k, align 4
  %10 = load i32* %nk.addr, align 4
  %cmp6 = icmp slt i32 %9, %10
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %11 = load double* %alpha.addr, align 8
  %12 = load i32* %k, align 4
  %13 = load i32* %i, align 4
  %14 = load [1024 x double]** %A.addr, align 4
  %arrayidx8 = getelementptr inbounds [1024 x double]* %14, i32 %13
  %arrayidx9 = getelementptr inbounds [1024 x double]* %arrayidx8, i32 0, i32 %12
  %15 = load double* %arrayidx9, align 4
  %mul10 = fmul double %11, %15
  %16 = load i32* %j, align 4
  %17 = load i32* %k, align 4
  %18 = load [1024 x double]** %B.addr, align 4
  %arrayidx11 = getelementptr inbounds [1024 x double]* %18, i32 %17
  %arrayidx12 = getelementptr inbounds [1024 x double]* %arrayidx11, i32 0, i32 %16
  %19 = load double* %arrayidx12, align 4
  %mul13 = fmul double %mul10, %19
  %20 = load i32* %j, align 4
  %21 = load i32* %i, align 4
  %22 = load [1024 x double]** %C.addr, align 4
  %arrayidx14 = getelementptr inbounds [1024 x double]* %22, i32 %21
  %arrayidx15 = getelementptr inbounds [1024 x double]* %arrayidx14, i32 0, i32 %20
  %23 = load double* %arrayidx15, align 4
  %add = fadd double %23, %mul13
  store double %add, double* %arrayidx15, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body7
  %24 = load i32* %k, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc16

for.inc16:                                        ; preds = %for.end
  %25 = load i32* %j, align 4
  %inc17 = add nsw i32 %25, 1
  store i32 %inc17, i32* %j, align 4
  br label %for.cond1

for.end18:                                        ; preds = %for.cond1
  br label %for.inc19

for.inc19:                                        ; preds = %for.end18
  %26 = load i32* %i, align 4
  %inc20 = add nsw i32 %26, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond

for.end21:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind
define internal void @print_array(i32 %ni, i32 %nj, [1024 x double]* %C) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %C.addr = alloca [1024 x double]*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nj, i32* %nj.addr, align 4
  store [1024 x double]* %C, [1024 x double]** %C.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %ni.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4
  %3 = load i32* %nj.addr, align 4
  %cmp2 = icmp slt i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE** @stderr, align 4
  %5 = load i32* %j, align 4
  %6 = load i32* %i, align 4
  %7 = load [1024 x double]** %C.addr, align 4
  %arrayidx = getelementptr inbounds [1024 x double]* %7, i32 %6
  %arrayidx4 = getelementptr inbounds [1024 x double]* %arrayidx, i32 0, i32 %5
  %8 = load double* %arrayidx4, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), double %8)
  %9 = load i32* %i, align 4
  %10 = load i32* %ni.addr, align 4
  %mul = mul nsw i32 %9, %10
  %11 = load i32* %j, align 4
  %add = add nsw i32 %mul, %11
  %rem = srem i32 %add, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %12 = load %struct._IO_FILE** @stderr, align 4
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %13 = load i32* %j, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %14 = load i32* %i, align 4
  %inc8 = add nsw i32 %14, 1
  store i32 %inc8, i32* %i, align 4
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  %15 = load %struct._IO_FILE** @stderr, align 4
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
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
