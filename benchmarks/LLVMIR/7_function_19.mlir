; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = and i64 %1, %2
  %5 = lshr i64 %0, %4
  %6 = urem i64 %5, %1
  %7 = xor i64 %6, %6
  %8 = xor i64 %7, %4
  %9 = urem i64 %8, %1
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
