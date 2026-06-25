; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or i64 %0, %0
  %5 = udiv i64 %0, %4
  %6 = icmp sgt i64 %5, %4
  %7 = ashr i64 %4, %1
  %8 = select i1 %6, i64 %7, i64 %2
  %9 = and i64 %0, %8
  %10 = ashr i64 %9, %5
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
