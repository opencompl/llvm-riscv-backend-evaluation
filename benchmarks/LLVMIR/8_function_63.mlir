; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %1, %0
  %5 = icmp ule i64 %4, %2
  %6 = lshr i64 %1, %2
  %7 = sdiv exact i64 %4, %6
  %8 = select i1 %5, i64 %1, i64 %7
  %9 = urem i64 %0, %8
  %10 = lshr exact i64 %7, %8
  %11 = icmp ule i64 %9, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
