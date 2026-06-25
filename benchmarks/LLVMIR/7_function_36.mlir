; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1, i64 %2) {
  %4 = ashr exact i64 %1, %2
  %5 = select i1 %0, i64 %4, i64 %2
  %6 = icmp ule i64 %1, %4
  %7 = or i64 %5, %5
  %8 = select i1 %6, i64 %7, i64 %4
  %9 = udiv i64 %8, %7
  %10 = lshr exact i64 %5, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
