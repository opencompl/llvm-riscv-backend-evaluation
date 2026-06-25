; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i1 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %2, %2
  %5 = select i1 %0, i64 %1, i64 %4
  %6 = lshr i64 %5, %2
  %7 = sdiv exact i64 %2, %4
  %8 = srem i64 %7, %2
  %9 = icmp slt i64 %6, %8
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
