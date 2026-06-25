; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = xor i64 %0, %0
  %5 = srem i64 %0, %4
  %6 = trunc i64 %2 to i32
  %7 = zext i32 %6 to i64
  %8 = and i64 %1, %7
  %9 = lshr i64 %5, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
