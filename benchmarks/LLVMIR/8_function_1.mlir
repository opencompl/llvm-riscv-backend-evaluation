; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i32 %1, i1 %2) {
  %4 = zext i32 %0 to i64
  %5 = trunc i64 %4 to i32
  %6 = zext i32 %5 to i64
  %7 = srem i64 %4, %6
  %8 = sext i32 %1 to i64
  %9 = select i1 %2, i64 %4, i64 %8
  %10 = srem i64 %8, %9
  %11 = srem i64 %7, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
