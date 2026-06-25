; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i1 %0, i64 %1, i64 %2) {
  %4 = icmp ule i64 %1, %1
  %5 = select i1 %4, i64 %2, i64 %1
  %6 = select i1 %0, i64 %1, i64 %5
  %7 = or disjoint i64 %2, %1
  %8 = urem i64 %5, %7
  %9 = or i64 %8, %7
  %10 = icmp ne i64 %6, %9
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
