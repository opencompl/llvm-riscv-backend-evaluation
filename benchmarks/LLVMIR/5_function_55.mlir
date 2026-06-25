; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = icmp sge i64 %0, %1
  %5 = select i1 %4, i64 %2, i64 %2
  %6 = urem i64 %5, %1
  %7 = select i1 %4, i64 %2, i64 %6
  %8 = icmp sge i64 %7, %0
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
