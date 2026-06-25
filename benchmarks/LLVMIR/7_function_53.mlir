; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i32
  %5 = sext i32 %4 to i64
  %6 = srem i64 %2, %2
  %7 = urem i64 %6, %1
  %8 = udiv i64 %1, %7
  %9 = or i64 %5, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
