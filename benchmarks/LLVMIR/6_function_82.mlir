; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = urem i64 %2, %0
  %5 = icmp ugt i64 %1, %4
  %6 = urem i64 %2, %2
  %7 = select i1 %5, i64 %6, i64 %2
  %8 = udiv i64 %0, %7
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
