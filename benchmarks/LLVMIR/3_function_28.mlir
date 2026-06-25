; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i1 %0, i64 %1, i64 %2) {
  %4 = or disjoint i64 %2, %1
  %5 = select i1 %0, i64 %1, i64 %4
  %6 = icmp eq i64 %5, %2
  ret i1 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
