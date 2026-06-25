; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %1 to i1
  %5 = select i1 %4, i64 %2, i64 %2
  %6 = icmp ule i64 %0, %5
  ret i1 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
