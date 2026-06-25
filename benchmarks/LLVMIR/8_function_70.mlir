; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i1 %1, i32 %2) {
  %4 = sext i32 %2 to i64
  %5 = icmp eq i64 %4, %0
  %6 = select i1 %1, i64 %0, i64 %0
  %7 = select i1 %5, i64 %4, i64 %6
  %8 = lshr exact i64 %0, %4
  %9 = select i1 %1, i64 %7, i64 %8
  %10 = lshr exact i64 %0, %9
  %11 = trunc i64 %10 to i1
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
