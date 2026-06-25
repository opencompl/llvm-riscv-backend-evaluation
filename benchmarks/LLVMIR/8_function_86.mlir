; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i32 %2) {
  %4 = udiv i64 %0, %1
  %5 = zext i32 %2 to i64
  %6 = lshr i64 %4, %5
  %7 = and i64 %1, %6
  %8 = trunc i64 %7 to i32
  %9 = sext i32 %8 to i64
  %10 = xor i64 %6, %9
  %11 = icmp sle i64 %10, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
