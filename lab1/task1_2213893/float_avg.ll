target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [40 x i8] c"Enter the number of elements (max %d): \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [49 x i8] c"Error: The number of elements cannot exceed %d.\0A\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"Enter %d floating-point numbers:\0A\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"Number %d: \00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"The average is: %f\0A\00", align 1

define dso_local i32 @main() #0 {
  %1 = alloca [100 x double], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  %5 = call i32 (ptr, ...) @printf(ptr @.str, i32 100)
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr @.str.1, ptr %2)
  %7 = load i32, ptr %2, align 4
  %8 = icmp sgt i32 %7, 100
  br i1 %8, label %9, label %11

9:                                              
  %10 = call i32 (ptr, ...) @printf(ptr @.str.2, i32 100)
  br label %34

11:                                               
  %12 = load i32, ptr %2, align 4
  %13 = call i32 (ptr, ...) @printf(ptr @.str.3, i32 %12)
  store i32 0, ptr %3, align 4
  br label %14

14:                                               
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %2, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %28

18:                                               
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 1
  %21 = call i32 (ptr, ...) @printf(ptr @.str.4, i32 %20)
  %22 = sext i32 %19 to i64
  %23 = getelementptr inbounds [100 x double], ptr %1, i64 0, i64 %22
  %24 = call i32 (ptr, ...) @__isoc99_scanf(ptr @.str.5, ptr %23)
  br label %25

25:                                              
  %26 = load i32, ptr %3, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %3, align 4
  br label %14

28:                                               
  %29 = getelementptr inbounds [100 x double], ptr %1, i64 0, i64 0
  %30 = load i32, ptr %2, align 4
  %31 = call double @calculateAverage(ptr %29, i32 %30)
  store double %31, ptr %4, align 8
  %32 = load double, ptr %4, align 8
  %33 = call i32 (ptr, ...) @printf(ptr @.str.6, double %32)
  br label %34

34:
  ret i32 0
}

declare i32 @printf(ptr, ...) #1

declare i32 @__isoc99_scanf(ptr, ...) #1

define dso_local double @calculateAverage(ptr %0, i32 %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store double 0.000000e+00, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %7

7:                                               
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %22

11:                                              
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %6, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds double, ptr %12, i64 %14
  %16 = load double, ptr %15, align 8
  %17 = load double, ptr %5, align 8
  %18 = fadd double %17, %16
  store double %18, ptr %5, align 8
  br label %19

19:                                               
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %6, align 4
  br label %7

22:                                              
  %23 = load i32, ptr %4, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %25, label %30

25:                                               
  %26 = load double, ptr %5, align 8
  %27 = load i32, ptr %4, align 4
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %26, %28
  br label %31

30:                                               
  br label %31

31:                                               
  %32 = phi double [ %29, %25 ], [ 0.000000e+00, %30 ]
  ret double %32
}

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
