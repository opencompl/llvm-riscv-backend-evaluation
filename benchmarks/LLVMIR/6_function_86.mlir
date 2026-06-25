; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i1 %2) {
  %4 = or i64 %0, %0
  %5 = or disjoint i64 %4, %1
  %6 = and i64 %4, %5
  %7 = select i1 %2, i64 %6, i64 %6
  %8 = xor i64 %0, %7
  %9 = or disjoint i64 %6, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
