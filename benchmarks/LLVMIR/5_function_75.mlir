; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = xor i64 %0, %0
  %4 = sdiv i64 %1, %3
  %5 = and i64 %0, %4
  %6 = sdiv i64 %1, %4
  %7 = srem i64 %5, %6
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
