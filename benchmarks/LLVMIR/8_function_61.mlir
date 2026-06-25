; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %1 to i32
  %5 = zext i32 %4 to i64
  %6 = xor i64 %5, %2
  %7 = or i64 %0, %0
  %8 = srem i64 %7, %5
  %9 = xor i64 %6, %8
  %10 = lshr exact i64 %0, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
