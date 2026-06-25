; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i1 %0, i64 %1, i64 %2) {
  %4 = select i1 %0, i64 %1, i64 %1
  %5 = or i64 %2, %4
  %6 = lshr i64 %5, %1
  %7 = urem i64 %5, %6
  %8 = srem i64 %7, %7
  %9 = icmp sge i64 %4, %8
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
