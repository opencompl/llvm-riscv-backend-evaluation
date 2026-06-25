; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %1 to i32
  %5 = zext i32 %4 to i64
  %6 = srem i64 %0, %5
  %7 = udiv i64 %2, %1
  %8 = and i64 %6, %7
  %9 = trunc i64 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
