; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i1 %1, i64 %2) {
  %4 = srem i64 %0, %2
  %5 = lshr exact i64 %4, %2
  %6 = select i1 %1, i64 %4, i64 %5
  %7 = and i64 %5, %2
  %8 = or disjoint i64 %6, %7
  %9 = icmp ugt i64 %0, %8
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
