; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = srem i64 %0, %1
  %4 = or i64 %0, %3
  %5 = icmp sle i64 %0, %4
  ret i1 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
