; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = sdiv i64 %1, %1
  %5 = or i64 %4, %2
  %6 = or i64 %5, %0
  %7 = sdiv exact i64 %0, %6
  %8 = xor i64 %7, %0
  %9 = srem i64 %0, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
