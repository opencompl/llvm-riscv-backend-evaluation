; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or disjoint i64 %0, %1
  %5 = udiv i64 %0, %0
  %6 = srem i64 %5, %0
  %7 = ashr exact i64 %2, %2
  %8 = srem i64 %6, %7
  %9 = lshr i64 %4, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
