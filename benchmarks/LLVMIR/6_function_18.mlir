; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i1 %2) {
  %4 = or i64 %0, %1
  %5 = select i1 %2, i64 %0, i64 %0
  %6 = ashr i64 %1, %0
  %7 = select i1 %2, i64 %6, i64 %6
  %8 = lshr i64 %5, %7
  %9 = icmp ne i64 %4, %8
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
