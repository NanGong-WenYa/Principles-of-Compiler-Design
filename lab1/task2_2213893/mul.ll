; ModuleID = 'mul.c'
source_filename = "mul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"your should input a lower word\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"wait for result\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 2, ptr %1, align 4
  store i32 1, ptr %3, align 4
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %2)
  %5 = load i32, ptr %2, align 4
  %6 = icmp sgt i32 %5, 10000
  br i1 %6, label %7, label %9

7:                                                ; preds = %0
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %11

9:                                                ; preds = %0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %11

11:                                               ; preds = %9, %7
  br label %12

12:                                               ; preds = %16, %11
  %13 = load i32, ptr %1, align 4
  %14 = load i32, ptr %2, align 4
  %15 = icmp sle i32 %13, %14
  br i1 %15, label %16, label %23

16:                                               ; preds = %12
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %1, align 4
  %19 = mul nsw i32 %17, %18
  store i32 %19, ptr %3, align 4
  %20 = load i32, ptr %1, align 4
  %21 = load i32, ptr %1, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, ptr %1, align 4
  br label %12, !llvm.loop !6

23:                                               ; preds = %12
  %24 = load i32, ptr %3, align 4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %24)
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
