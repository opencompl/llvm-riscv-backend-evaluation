; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = trunc i64 %0 to i32
  %4 = zext i32 %3 to i64
  %5 = ashr exact i64 %4, %1
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  %10 = urem i64 %0, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
