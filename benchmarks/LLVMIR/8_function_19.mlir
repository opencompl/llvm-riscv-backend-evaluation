; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or i64 %0, %1
  %5 = or disjoint i64 %4, %2
  %6 = urem i64 %5, %4
  %7 = trunc i64 %6 to i1
  %8 = select i1 %7, i64 %2, i64 %6
  %9 = trunc i64 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = icmp ugt i64 %10, %8
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
