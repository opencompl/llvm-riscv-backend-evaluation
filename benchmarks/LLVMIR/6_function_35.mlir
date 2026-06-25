; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i32 %1, i64 %2) {
  %4 = sext i32 %1 to i64
  %5 = srem i64 %2, %0
  %6 = udiv i64 %4, %5
  %7 = zext i32 %1 to i64
  %8 = lshr i64 %6, %7
  %9 = sdiv exact i64 %0, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
