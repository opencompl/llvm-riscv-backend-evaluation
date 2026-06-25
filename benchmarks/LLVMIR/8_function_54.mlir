; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i32 %2) {
  %4 = or i64 %0, %0
  %5 = zext i32 %2 to i64
  %6 = lshr i64 %1, %5
  %7 = sext i32 %2 to i64
  %8 = urem i64 %6, %7
  %9 = and i64 %8, %7
  %10 = srem i64 %4, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
