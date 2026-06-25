; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i32 %0, i64 %1, i64 %2) {
  %4 = sext i32 %0 to i64
  %5 = trunc i64 %4 to i1
  %6 = srem i64 %4, %4
  %7 = select i1 %5, i64 %6, i64 %1
  %8 = xor i64 %1, %1
  %9 = udiv i64 %8, %2
  %10 = srem i64 %7, %9
  %11 = trunc i64 %10 to i1
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
