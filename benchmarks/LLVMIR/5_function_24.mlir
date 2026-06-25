; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %0, %1
  %5 = xor i64 %2, %1
  %6 = and i64 %5, %2
  %7 = lshr i64 %4, %6
  %8 = trunc i64 %7 to i1
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
