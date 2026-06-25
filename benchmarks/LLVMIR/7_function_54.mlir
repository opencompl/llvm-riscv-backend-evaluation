; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %2 to i32
  %5 = zext i32 %4 to i64
  %6 = lshr exact i64 %1, %5
  %7 = trunc i64 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = urem i64 %0, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
