; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = icmp ugt i64 %0, %0
  %5 = or disjoint i64 %1, %2
  %6 = lshr exact i64 %5, %0
  %7 = sdiv exact i64 %5, %6
  %8 = select i1 %4, i64 %7, i64 %2
  %9 = xor i64 %8, %0
  %10 = urem i64 %9, %7
  %11 = trunc i64 %10 to i1
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
