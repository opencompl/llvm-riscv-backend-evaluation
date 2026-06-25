; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = urem i64 %0, %0
  %5 = srem i64 %1, %2
  %6 = udiv i64 %0, %5
  %7 = or i64 %6, %2
  %8 = xor i64 %4, %7
  %9 = xor i64 %2, %1
  %10 = srem i64 %8, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
