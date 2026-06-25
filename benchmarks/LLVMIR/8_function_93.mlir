; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i1 %0, i64 %1, i64 %2) {
  %4 = srem i64 %1, %2
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = udiv i64 %6, %1
  %8 = select i1 %0, i64 %6, i64 %7
  %9 = trunc i64 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
