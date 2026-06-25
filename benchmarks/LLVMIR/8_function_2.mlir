; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i32 %1, i64 %2) {
  %4 = sext i32 %1 to i64
  %5 = and i64 %4, %4
  %6 = sext i32 %1 to i64
  %7 = urem i64 %2, %6
  %8 = lshr exact i64 %5, %7
  %9 = and i64 %0, %8
  %10 = urem i64 %2, %4
  %11 = urem i64 %9, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
