; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = urem i64 %0, %0
  %5 = icmp sge i64 %4, %1
  %6 = urem i64 %2, %1
  %7 = srem i64 %4, %6
  %8 = select i1 %5, i64 %0, i64 %7
  %9 = sdiv exact i64 %4, %8
  %10 = lshr exact i64 %0, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
