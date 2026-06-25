; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %0, %1
  %5 = urem i64 %2, %2
  %6 = lshr i64 %2, %5
  %7 = or disjoint i64 %1, %1
  %8 = srem i64 %7, %6
  %9 = lshr exact i64 %6, %8
  %10 = srem i64 %4, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
