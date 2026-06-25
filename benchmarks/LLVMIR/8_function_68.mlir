; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = sdiv i64 %0, %0
  %4 = udiv i64 %0, %3
  %5 = srem i64 %4, %1
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
