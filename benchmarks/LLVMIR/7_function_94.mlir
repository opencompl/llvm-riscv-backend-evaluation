; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = sdiv exact i64 %0, %1
  %5 = srem i64 %2, %2
  %6 = sdiv exact i64 %5, %0
  %7 = srem i64 %0, %6
  %8 = lshr exact i64 %7, %0
  %9 = sdiv i64 %4, %8
  %10 = trunc i64 %9 to i1
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
