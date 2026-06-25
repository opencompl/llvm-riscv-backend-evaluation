; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i32 %0, i64 %1, i64 %2) {
  %4 = zext i32 %0 to i64
  %5 = lshr exact i64 %4, %4
  %6 = udiv i64 %5, %5
  %7 = srem i64 %2, %6
  %8 = urem i64 %1, %7
  %9 = urem i64 %5, %8
  %10 = icmp sle i64 %6, %9
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
