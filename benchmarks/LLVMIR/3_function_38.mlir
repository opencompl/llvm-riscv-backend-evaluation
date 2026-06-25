; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0) {
  %2 = trunc i64 %0 to i32
  %3 = sext i32 %2 to i64
  %4 = icmp sle i64 %3, %0
  ret i1 %4
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
