; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i1 %1, i64 %2) {
  %4 = select i1 %1, i64 %2, i64 %0
  %5 = urem i64 %4, %4
  %6 = udiv i64 %0, %5
  %7 = ashr exact i64 %4, %5
  %8 = xor i64 %7, %2
  %9 = lshr exact i64 %7, %8
  %10 = icmp slt i64 %6, %9
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
