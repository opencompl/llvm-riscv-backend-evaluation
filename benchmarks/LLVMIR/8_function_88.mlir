; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %0, %0
  %5 = xor i64 %0, %4
  %6 = xor i64 %1, %2
  %7 = xor i64 %4, %6
  %8 = sdiv i64 %5, %7
  %9 = srem i64 %8, %1
  %10 = xor i64 %2, %0
  %11 = icmp ugt i64 %9, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
