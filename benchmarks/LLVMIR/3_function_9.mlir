; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0) {
  %2 = icmp ne i64 %0, %0
  %3 = select i1 %2, i64 %0, i64 %0
  %4 = icmp sle i64 %3, %0
  ret i1 %4
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
