; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = urem i64 %0, %1
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = xor i64 %2, %2
  %8 = and i64 %6, %7
  %9 = trunc i64 %2 to i32
  %10 = sext i32 %9 to i64
  %11 = or i64 %8, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
