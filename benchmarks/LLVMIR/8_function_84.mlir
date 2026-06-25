; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i32 %1) {
  %3 = trunc i64 %0 to i32
  %4 = sext i32 %3 to i64
  %5 = zext i32 %1 to i64
  %6 = srem i64 %0, %5
  %7 = trunc i64 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = and i64 %4, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
