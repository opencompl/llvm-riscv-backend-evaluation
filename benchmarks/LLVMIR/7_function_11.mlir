; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1, i64 %2) {
  %4 = zext i32 %0 to i64
  %5 = xor i64 %4, %1
  %6 = lshr exact i64 %2, %4
  %7 = trunc i64 %6 to i32
  %8 = zext i32 %7 to i64
  %9 = sdiv exact i64 %5, %8
  %10 = srem i64 %4, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
