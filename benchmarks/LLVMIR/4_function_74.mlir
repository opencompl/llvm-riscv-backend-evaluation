; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = icmp ult i64 %0, %1
  %5 = select i1 %4, i64 %1, i64 %0
  %6 = trunc i64 %5 to i1
  %7 = select i1 %6, i64 %2, i64 %5
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
