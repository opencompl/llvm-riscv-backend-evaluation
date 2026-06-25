; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = sdiv i64 %0, %1
  %4 = trunc i64 %3 to i32
  %5 = sext i32 %4 to i64
  %6 = urem i64 %0, %5
  %7 = lshr exact i64 %0, %6
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
