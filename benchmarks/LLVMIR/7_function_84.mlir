; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or disjoint i64 %0, %1
  %5 = or disjoint i64 %4, %0
  %6 = and i64 %2, %5
  %7 = xor i64 %6, %1
  %8 = and i64 %4, %7
  %9 = srem i64 %8, %4
  %10 = trunc i64 %9 to i1
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
