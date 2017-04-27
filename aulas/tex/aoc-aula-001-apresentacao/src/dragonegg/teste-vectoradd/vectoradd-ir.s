; ModuleID = 'vectoradd.c'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f16:16:16-f32:32:32-f64:64:64-f128:128:128-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Debian 4.7.3-8) 4.7.3 LLVM: 3.4svn\22"

@.cst = linker_private constant [18 x i8] c"final result: %f\0A\00", align 8

; Function Attrs: nounwind uwtable
define i32 @main(...) unnamed_addr #0 {
entry:
  %n = alloca i32
  %a = alloca i32*
  %b = alloca i32*
  %c = alloca i32*
  %bytes = alloca i64
  %i = alloca i32
  %sum = alloca i32
  %"<retval>" = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %"ssa point" = bitcast i32 0 to i32
  br label %"2"

"2":                                              ; preds = %entry
  %0 = call noalias i8* @malloc(i64 400000) #1
  %1 = bitcast i8* %0 to i32*
  %2 = call noalias i8* @malloc(i64 400000) #1
  %3 = bitcast i8* %2 to i32*
  %4 = call noalias i8* @malloc(i64 400000) #1
  %5 = bitcast i8* %4 to i32*
  br label %"4"

"3":                                              ; preds = %"4"
  %6 = sext i32 %18 to i64
  %7 = mul i64 %6, 4
  %8 = bitcast i32* %1 to i8*
  %9 = getelementptr i8* %8, i64 %7
  %10 = bitcast i8* %9 to i32*
  store i32 %18, i32* %10, align 4
  %11 = sext i32 %18 to i64
  %12 = mul i64 %11, 4
  %13 = bitcast i32* %3 to i8*
  %14 = getelementptr i8* %13, i64 %12
  %15 = bitcast i8* %14 to i32*
  %16 = mul i32 %18, 2
  store i32 %16, i32* %15, align 4
  %17 = add i32 %18, 1
  br label %"4"

"4":                                              ; preds = %"3", %"2"
  %18 = phi i32 [ %17, %"3" ], [ 0, %"2" ]
  %19 = icmp slt i32 %18, 100000
  br i1 %19, label %"3", label %"5"

"5":                                              ; preds = %"4"
  br label %"7"

"6":                                              ; preds = %"7"
  %20 = sext i32 %39 to i64
  %21 = mul i64 %20, 4
  %22 = bitcast i32* %5 to i8*
  %23 = getelementptr i8* %22, i64 %21
  %24 = bitcast i8* %23 to i32*
  %25 = sext i32 %39 to i64
  %26 = mul i64 %25, 4
  %27 = bitcast i32* %1 to i8*
  %28 = getelementptr i8* %27, i64 %26
  %29 = bitcast i8* %28 to i32*
  %30 = load i32* %29, align 4
  %31 = sext i32 %39 to i64
  %32 = mul i64 %31, 4
  %33 = bitcast i32* %3 to i8*
  %34 = getelementptr i8* %33, i64 %32
  %35 = bitcast i8* %34 to i32*
  %36 = load i32* %35, align 4
  %37 = add i32 %30, %36
  store i32 %37, i32* %24, align 4
  %38 = add i32 %39, 1
  br label %"7"

"7":                                              ; preds = %"6", %"5"
  %39 = phi i32 [ %38, %"6" ], [ 0, %"5" ]
  %40 = icmp slt i32 %39, 100000
  br i1 %40, label %"6", label %"8"

"8":                                              ; preds = %"7"
  br label %"10"

"9":                                              ; preds = %"10"
  %41 = sext i32 %49 to i64
  %42 = mul i64 %41, 4
  %43 = bitcast i32* %5 to i8*
  %44 = getelementptr i8* %43, i64 %42
  %45 = bitcast i8* %44 to i32*
  %46 = load i32* %45, align 4
  %47 = add i32 %46, %50
  %48 = add i32 %49, 1
  br label %"10"

"10":                                             ; preds = %"9", %"8"
  %49 = phi i32 [ %48, %"9" ], [ 0, %"8" ]
  %50 = phi i32 [ %47, %"9" ], [ 0, %"8" ]
  %51 = icmp slt i32 %49, 100000
  br i1 %51, label %"9", label %"11"

"11":                                             ; preds = %"10"
  %52 = sdiv i32 %50, 100000
  %53 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([18 x i8]* @.cst, i64 0, i64 0), i32 %52) #1
  %54 = bitcast i32* %1 to i8*
  call void @free(i8* %54) #1
  %55 = bitcast i32* %3 to i8*
  call void @free(i8* %55) #1
  %56 = bitcast i32* %5 to i8*
  call void @free(i8* %56) #1
  br label %"12"

"12":                                             ; preds = %"11"
  store i32 0, i32* %"<retval>", align 1
  br label %return

return:                                           ; preds = %"12"
  %57 = load i32* %"<retval>", align 4
  ret i32 %57
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...)

; Function Attrs: nounwind
declare void @free(i8*) #1

attributes #0 = { nounwind uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { nounwind }
