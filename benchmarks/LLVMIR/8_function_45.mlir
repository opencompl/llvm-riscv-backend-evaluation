; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i32 %1, i64 %2) {
  %4 = srem i64 %0, %0
  %5 = lshr exact i64 %0, %0
  %6 = urem i64 %4, %5
  %7 = sext i32 %1 to i64
  %8 = ashr i64 %6, %7
  %9 = and i64 %2, %2
  %10 = srem i64 %9, %6
  %11 = lshr i64 %8, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
