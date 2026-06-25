; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %0, %1
  %5 = and i64 %2, %0
  %6 = or i64 %4, %5
  %7 = or i64 %2, %6
  %8 = sdiv i64 %4, %7
  %9 = and i64 %7, %8
  %10 = or disjoint i64 %4, %9
  %11 = icmp uge i64 %10, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
