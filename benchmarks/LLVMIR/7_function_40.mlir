; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i32 %2) {
  %4 = trunc i64 %0 to i32
  %5 = zext i32 %4 to i64
  %6 = lshr i64 %5, %1
  %7 = sext i32 %2 to i64
  %8 = srem i64 %7, %1
  %9 = lshr exact i64 %8, %7
  %10 = ashr exact i64 %6, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
