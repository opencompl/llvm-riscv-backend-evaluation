; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = xor i64 %1, %2
  %5 = and i64 %1, %4
  %6 = urem i64 %5, %1
  %7 = lshr i64 %0, %6
  %8 = or i64 %0, %7
  %9 = urem i64 %0, %8
  %10 = trunc i64 %9 to i1
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
