; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or disjoint i64 %0, %0
  %5 = icmp sgt i64 %4, %1
  %6 = select i1 %5, i64 %4, i64 %2
  %7 = trunc i64 %6 to i1
  %8 = trunc i64 %6 to i1
  %9 = lshr i64 %0, %6
  %10 = select i1 %8, i64 %2, i64 %9
  %11 = select i1 %7, i64 %6, i64 %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
