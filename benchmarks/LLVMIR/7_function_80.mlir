; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = icmp eq i64 %0, %1
  %5 = udiv i64 %2, %1
  %6 = select i1 %4, i64 %2, i64 %5
  %7 = or i64 %0, %2
  %8 = icmp ult i64 %1, %7
  %9 = select i1 %8, i64 %6, i64 %0
  %10 = ashr exact i64 %6, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
