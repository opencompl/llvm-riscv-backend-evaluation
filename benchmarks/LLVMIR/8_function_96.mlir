; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %0, %1
  %5 = srem i64 %0, %4
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  %10 = urem i64 %2, %2
  %11 = udiv i64 %9, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
