; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = lshr exact i64 %0, %0
  %5 = and i64 %1, %4
  %6 = xor i64 %4, %5
  %7 = urem i64 %2, %4
  %8 = sdiv exact i64 %7, %4
  %9 = ashr exact i64 %6, %8
  %10 = trunc i64 %9 to i1
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
