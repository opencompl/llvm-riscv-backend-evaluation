; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i32 %1) {
  %3 = urem i64 %0, %0
  %4 = zext i32 %1 to i64
  %5 = lshr exact i64 %3, %4
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = xor i64 %3, %7
  %9 = ashr i64 %0, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
