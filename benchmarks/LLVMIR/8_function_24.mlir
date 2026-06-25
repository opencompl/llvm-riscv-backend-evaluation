; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = and i64 %0, %0
  %5 = trunc i64 %1 to i32
  %6 = zext i32 %5 to i64
  %7 = trunc i64 %2 to i32
  %8 = sext i32 %7 to i64
  %9 = udiv i64 %2, %8
  %10 = lshr exact i64 %6, %9
  %11 = icmp sle i64 %4, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
