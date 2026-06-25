; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = urem i64 %0, %1
  %4 = trunc i64 %3 to i32
  %5 = sext i32 %4 to i64
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = urem i64 %5, %7
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
