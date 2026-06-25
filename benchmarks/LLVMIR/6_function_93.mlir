; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = xor i64 %2, %0
  %5 = lshr i64 %0, %4
  %6 = srem i64 %1, %5
  %7 = srem i64 %6, %4
  %8 = lshr exact i64 %0, %7
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
