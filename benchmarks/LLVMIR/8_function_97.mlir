; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i32 %2) {
  %4 = trunc i64 %0 to i32
  %5 = sext i32 %4 to i64
  %6 = xor i64 %5, %1
  %7 = zext i32 %2 to i64
  %8 = urem i64 %7, %1
  %9 = or i64 %6, %8
  %10 = sext i32 %2 to i64
  %11 = udiv i64 %9, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
