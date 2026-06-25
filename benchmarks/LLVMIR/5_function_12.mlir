; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = lshr exact i64 %1, %1
  %5 = sdiv i64 %0, %4
  %6 = icmp sgt i64 %5, %2
  %7 = select i1 %6, i64 %1, i64 %2
  %8 = icmp sle i64 %5, %7
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
