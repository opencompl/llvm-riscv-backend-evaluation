; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = and i64 %0, %1
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = udiv i64 %2, %0
  %8 = udiv i64 %6, %7
  %9 = srem i64 %7, %1
  %10 = srem i64 %8, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
