; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = icmp eq i64 %0, %1
  %4 = xor i64 %1, %0
  %5 = select i1 %3, i64 %4, i64 %4
  %6 = trunc i64 %5 to i1
  ret i1 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
