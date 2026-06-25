; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = lshr exact i64 %0, %1
  %5 = or disjoint i64 %1, %1
  %6 = udiv i64 %5, %2
  %7 = xor i64 %2, %0
  %8 = sdiv exact i64 %7, %2
  %9 = urem i64 %6, %8
  %10 = srem i64 %4, %9
  %11 = trunc i64 %10 to i1
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
