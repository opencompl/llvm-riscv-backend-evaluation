; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %1, %2
  %5 = trunc i64 %0 to i1
  %6 = select i1 %5, i64 %2, i64 %2
  %7 = udiv i64 %4, %6
  %8 = icmp sge i64 %0, %7
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
