; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = icmp slt i64 %0, %0
  %5 = select i1 %4, i64 %1, i64 %0
  %6 = srem i64 %5, %0
  %7 = and i64 %6, %6
  %8 = trunc i64 %7 to i1
  %9 = xor i64 %1, %2
  %10 = select i1 %8, i64 %7, i64 %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
