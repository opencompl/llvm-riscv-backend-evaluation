; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = xor i64 %0, %1
  %5 = and i64 %2, %1
  %6 = urem i64 %5, %1
  %7 = srem i64 %4, %6
  %8 = srem i64 %7, %6
  %9 = and i64 %6, %8
  %10 = icmp sge i64 %7, %9
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
