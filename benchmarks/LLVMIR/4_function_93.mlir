; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = and i64 %0, %0
  %4 = xor i64 %1, %3
  %5 = or disjoint i64 %4, %0
  %6 = icmp ugt i64 %3, %5
  ret i1 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
