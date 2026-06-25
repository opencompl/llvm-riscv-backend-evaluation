; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %0, %1
  %5 = xor i64 %0, %4
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = xor i64 %4, %2
  %9 = xor i64 %7, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
