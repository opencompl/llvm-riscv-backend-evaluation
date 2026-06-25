; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = ashr i64 %0, %1
  %5 = srem i64 %4, %1
  %6 = sdiv exact i64 %2, %5
  %7 = or disjoint i64 %4, %6
  %8 = or disjoint i64 %4, %4
  %9 = sdiv exact i64 %8, %6
  %10 = srem i64 %7, %9
  %11 = trunc i64 %10 to i1
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
