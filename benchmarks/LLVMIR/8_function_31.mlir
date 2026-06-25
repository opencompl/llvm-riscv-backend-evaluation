; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %1, %0
  %5 = udiv i64 %0, %4
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = lshr i64 %5, %2
  %9 = icmp ult i64 %7, %8
  %10 = srem i64 %7, %4
  %11 = select i1 %9, i64 %2, i64 %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
