; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %2, %1
  %5 = xor i64 %1, %4
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = and i64 %0, %7
  %9 = trunc i64 %8 to i32
  %10 = zext i32 %9 to i64
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
