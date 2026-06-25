; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %0, %1
  %5 = udiv i64 %2, %2
  %6 = sdiv exact i64 %4, %5
  %7 = srem i64 %4, %4
  %8 = or disjoint i64 %5, %7
  %9 = sdiv exact i64 %5, %8
  %10 = sdiv exact i64 %9, %2
  %11 = srem i64 %6, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
