; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = ashr i64 %0, %1
  %5 = icmp uge i64 %4, %2
  %6 = urem i64 %2, %1
  %7 = select i1 %5, i64 %1, i64 %6
  %8 = udiv i64 %1, %4
  %9 = ashr exact i64 %7, %8
  %10 = udiv i64 %7, %9
  %11 = icmp ugt i64 %10, %7
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
