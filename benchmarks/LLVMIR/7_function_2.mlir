; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = urem i64 %0, %1
  %5 = ashr exact i64 %0, %2
  %6 = urem i64 %5, %1
  %7 = sdiv i64 %6, %1
  %8 = lshr i64 %6, %7
  %9 = xor i64 %4, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
