; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i32 %1, i64 %2) {
  %4 = zext i32 %1 to i64
  %5 = xor i64 %2, %2
  %6 = sdiv i64 %4, %5
  %7 = urem i64 %0, %6
  %8 = lshr i64 %5, %4
  %9 = udiv i64 %7, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
