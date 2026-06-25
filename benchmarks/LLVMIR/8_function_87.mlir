; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1, i64 %2) {
  %4 = sext i32 %0 to i64
  %5 = urem i64 %4, %1
  %6 = lshr i64 %5, %1
  %7 = trunc i64 %2 to i32
  %8 = zext i32 %7 to i64
  %9 = ashr exact i64 %6, %8
  %10 = trunc i64 %9 to i32
  %11 = sext i32 %10 to i64
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
