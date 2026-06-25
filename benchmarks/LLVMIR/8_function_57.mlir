; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = and i64 %0, %1
  %5 = and i64 %0, %4
  %6 = icmp slt i64 %1, %2
  %7 = select i1 %6, i64 %4, i64 %4
  %8 = icmp ugt i64 %7, %5
  %9 = select i1 %8, i64 %0, i64 %7
  %10 = or i64 %7, %9
  %11 = icmp sgt i64 %5, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
