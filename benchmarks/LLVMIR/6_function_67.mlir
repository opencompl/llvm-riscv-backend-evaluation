; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = xor i64 %1, %1
  %5 = lshr exact i64 %1, %4
  %6 = and i64 %0, %5
  %7 = xor i64 %2, %6
  %8 = srem i64 %1, %7
  %9 = ashr i64 %0, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
