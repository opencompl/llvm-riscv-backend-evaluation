; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i32 %1, i32 %2) {
  %4 = zext i32 %1 to i64
  %5 = xor i64 %0, %4
  %6 = sext i32 %2 to i64
  %7 = udiv i64 %6, %6
  %8 = srem i64 %5, %7
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
