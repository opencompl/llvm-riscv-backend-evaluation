; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i32
  %5 = sext i32 %4 to i64
  %6 = sdiv exact i64 %0, %5
  %7 = udiv i64 %0, %2
  %8 = lshr exact i64 %1, %7
  %9 = urem i64 %5, %1
  %10 = xor i64 %8, %9
  %11 = srem i64 %6, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
