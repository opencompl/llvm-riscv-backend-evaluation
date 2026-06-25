; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0) {
  %2 = icmp sge i64 %0, %0
  %3 = select i1 %2, i64 %0, i64 %0
  %4 = trunc i64 %3 to i32
  ret i32 %4
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
