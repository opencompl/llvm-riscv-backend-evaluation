; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i32
  %5 = sext i32 %4 to i64
  %6 = trunc i64 %1 to i1
  %7 = select i1 %6, i64 %2, i64 %0
  %8 = srem i64 %1, %7
  %9 = xor i64 %0, %8
  %10 = sdiv i64 %5, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
