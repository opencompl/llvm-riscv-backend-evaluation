; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i32 %2) {
  %4 = zext i32 %2 to i64
  %5 = trunc i64 %4 to i32
  %6 = zext i32 %5 to i64
  %7 = srem i64 %6, %6
  %8 = srem i64 %1, %7
  %9 = udiv i64 %0, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
