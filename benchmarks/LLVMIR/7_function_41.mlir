; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = xor i64 %0, %1
  %5 = and i64 %1, %4
  %6 = lshr i64 %2, %5
  %7 = lshr i64 %4, %6
  %8 = and i64 %4, %2
  %9 = udiv i64 %7, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
