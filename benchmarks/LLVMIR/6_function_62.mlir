; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = lshr exact i64 %0, %1
  %5 = xor i64 %4, %2
  %6 = ashr i64 %4, %5
  %7 = trunc i64 %6 to i1
  %8 = select i1 %7, i64 %4, i64 %2
  %9 = urem i64 %6, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
