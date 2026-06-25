; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %0, %0
  %5 = trunc i64 %1 to i1
  %6 = select i1 %5, i64 %2, i64 %4
  %7 = icmp ugt i64 %4, %6
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
