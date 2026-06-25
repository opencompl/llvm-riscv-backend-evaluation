; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i1 %1, i64 %2) {
  %4 = or disjoint i64 %0, %0
  %5 = select i1 %1, i64 %2, i64 %4
  %6 = lshr i64 %5, %0
  %7 = srem i64 %0, %6
  %8 = and i64 %7, %5
  %9 = xor i64 %0, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
