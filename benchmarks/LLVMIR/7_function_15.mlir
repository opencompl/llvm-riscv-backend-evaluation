; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i32 %1, i64 %2) {
  %4 = sext i32 %1 to i64
  %5 = icmp ule i64 %0, %4
  %6 = srem i64 %2, %4
  %7 = sdiv i64 %2, %6
  %8 = lshr i64 %0, %7
  %9 = select i1 %5, i64 %7, i64 %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
