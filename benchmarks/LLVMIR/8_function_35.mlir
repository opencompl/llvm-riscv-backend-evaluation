; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %1, %0
  %5 = sdiv i64 %4, %2
  %6 = lshr exact i64 %0, %5
  %7 = trunc i64 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = trunc i64 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = trunc i64 %10 to i1
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
