; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %2, %0
  %5 = or disjoint i64 %2, %4
  %6 = xor i64 %5, %2
  %7 = and i64 %6, %6
  %8 = xor i64 %2, %7
  %9 = xor i64 %1, %8
  %10 = icmp ne i64 %0, %9
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
