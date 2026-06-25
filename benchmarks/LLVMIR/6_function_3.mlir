; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = icmp sge i64 %0, %0
  %5 = srem i64 %1, %2
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = select i1 %4, i64 %5, i64 %7
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
