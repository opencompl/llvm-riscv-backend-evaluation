; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = xor i64 %0, %1
  %5 = srem i64 %4, %0
  %6 = udiv i64 %1, %5
  %7 = or i64 %2, %6
  %8 = xor i64 %5, %7
  %9 = urem i64 %4, %8
  %10 = urem i64 %9, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
