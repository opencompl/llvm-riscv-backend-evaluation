; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i32
  %5 = sext i32 %4 to i64
  %6 = urem i64 %5, %1
  %7 = icmp ule i64 %5, %6
  %8 = udiv i64 %1, %2
  %9 = urem i64 %8, %1
  %10 = select i1 %7, i64 %1, i64 %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
