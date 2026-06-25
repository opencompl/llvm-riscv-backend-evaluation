; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i1 %1, i64 %2) {
  %4 = select i1 %1, i64 %2, i64 %0
  %5 = or disjoint i64 %4, %4
  %6 = icmp slt i64 %0, %5
  %7 = select i1 %6, i64 %5, i64 %4
  %8 = srem i64 %7, %0
  %9 = icmp eq i64 %7, %8
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
