; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %0, %1
  %5 = or i64 %0, %4
  %6 = xor i64 %5, %2
  %7 = trunc i64 %6 to i1
  %8 = lshr i64 %4, %2
  %9 = icmp slt i64 %8, %6
  %10 = select i1 %9, i64 %4, i64 %6
  %11 = select i1 %7, i64 %10, i64 %2
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
