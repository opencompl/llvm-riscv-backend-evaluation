; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i32 %2) {
  %4 = zext i32 %2 to i64
  %5 = lshr exact i64 %1, %4
  %6 = udiv i64 %5, %0
  %7 = xor i64 %6, %5
  %8 = xor i64 %0, %7
  %9 = xor i64 %8, %1
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
