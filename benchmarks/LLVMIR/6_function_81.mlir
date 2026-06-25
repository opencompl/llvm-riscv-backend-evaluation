; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %1, %2
  %5 = and i64 %1, %4
  %6 = ashr exact i64 %0, %5
  %7 = lshr exact i64 %6, %5
  %8 = udiv i64 %6, %7
  %9 = trunc i64 %8 to i1
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
