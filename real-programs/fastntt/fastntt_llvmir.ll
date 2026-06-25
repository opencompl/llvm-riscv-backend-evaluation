; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-n8:16:32:64-S128-p270:32:32:32:32-p271:32:32:32:32-p272:64:64:64:64-i64:64-i128:128-f80:128-p0:64:64:64:64-i1:8-i8:8-i16:16-i32:32-f16:16-f64:64-f128:128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: alwaysinline nounwind uwtable
define dso_local void @fastNTT(ptr noundef %0, i64 noundef %1, i64 noundef %2, ptr noundef %3, i64 noundef %4, i64 noundef %5) #0 {
  %7 = icmp ne i64 %4, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %6
  br label %10

9:                                                ; preds = %6
  br label %10

10:                                               ; preds = %8, %9
  %11 = phi i64 [ 2, %9 ], [ %1, %8 ]
  %12 = icmp ne i64 %4, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  br label %16

14:                                               ; preds = %10
  %15 = sdiv i64 %5, 2
  br label %16

16:                                               ; preds = %13, %14
  %17 = phi i64 [ %15, %14 ], [ 1, %13 ]
  %18 = sdiv i64 %1, 2
  br label %19

19:                                               ; preds = %87, %16
  %20 = phi i64 [ %86, %87 ], [ %17, %16 ]
  %21 = phi i64 [ %72, %87 ], [ %18, %16 ]
  %22 = phi i64 [ %88, %87 ], [ 0, %16 ]
  %23 = phi i64 [ %79, %87 ], [ %11, %16 ]
  br label %24

24:                                               ; preds = %28, %19
  %25 = phi i64 [ %30, %28 ], [ 0, %19 ]
  %26 = phi i64 [ %29, %28 ], [ %1, %19 ]
  %27 = icmp sgt i64 %26, 1
  br i1 %27, label %28, label %31

28:                                               ; preds = %24
  %29 = ashr i64 %26, 1
  %30 = add nsw i64 %25, 1
  br label %24

31:                                               ; preds = %24
  %32 = icmp slt i64 %22, %25
  br i1 %32, label %33, label %89

33:                                               ; preds = %31
  br label %34

34:                                               ; preds = %69, %33
  %35 = phi i64 [ %70, %69 ], [ 0, %33 ]
  %36 = sdiv i64 %1, %23
  %37 = icmp slt i64 %35, %36
  br i1 %37, label %38, label %71

38:                                               ; preds = %34
  br label %39

39:                                               ; preds = %66, %38
  %40 = phi i64 [ %67, %66 ], [ 0, %38 ]
  %41 = sdiv i64 %23, 2
  %42 = icmp slt i64 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %39
  %44 = mul nsw i64 %35, %23
  %45 = add nsw i64 %44, %40
  %46 = getelementptr inbounds i64, ptr %0, i64 %45
  %47 = load i64, ptr %46, align 8
  %48 = sdiv i64 %23, 2
  %49 = add nsw i64 %45, %48
  %50 = getelementptr inbounds i64, ptr %0, i64 %49
  %51 = load i64, ptr %50, align 8
  %52 = mul nsw i64 2, %40
  %53 = add nsw i64 %52, 1
  %54 = mul nsw i64 %53, %21
  %55 = getelementptr inbounds i64, ptr %3, i64 %54
  %56 = load i64, ptr %55, align 8
  %57 = mul nsw i64 %56, %51
  %58 = srem i64 %57, %2
  %59 = add nsw i64 %47, %58
  %60 = srem i64 %59, %2
  %61 = sub nsw i64 %47, %58
  %62 = add nsw i64 %61, %2
  %63 = srem i64 %62, %2
  %64 = getelementptr inbounds i64, ptr %0, i64 %45
  store i64 %60, ptr %64, align 8
  %65 = getelementptr inbounds i64, ptr %0, i64 %49
  store i64 %63, ptr %65, align 8
  br label %66

66:                                               ; preds = %43
  %67 = add nsw i64 %40, 1
  br label %39

68:                                               ; preds = %39
  br label %69

69:                                               ; preds = %68
  %70 = add nsw i64 %35, 1
  br label %34

71:                                               ; preds = %34
  %72 = sdiv i64 %21, 2
  %73 = icmp ne i64 %4, 0
  br i1 %73, label %74, label %76

74:                                               ; preds = %71
  %75 = sdiv i64 %23, 2
  br label %78

76:                                               ; preds = %71
  %77 = add nsw i64 %23, %23
  br label %78

78:                                               ; preds = %74, %76
  %79 = phi i64 [ %77, %76 ], [ %75, %74 ]
  %80 = icmp ne i64 %4, 0
  br i1 %80, label %81, label %83

81:                                               ; preds = %78
  %82 = add nsw i64 %20, %20
  br label %85

83:                                               ; preds = %78
  %84 = sdiv i64 %20, 2
  br label %85

85:                                               ; preds = %81, %83
  %86 = phi i64 [ %84, %83 ], [ %82, %81 ]
  br label %87

87:                                               ; preds = %85
  %88 = add nsw i64 %22, 1
  br label %19

89:                                               ; preds = %31
  ret void
}

attributes #0 = { alwaysinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5, !6}

!0 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i32 2, !"Debug Info Version", i32 3}
