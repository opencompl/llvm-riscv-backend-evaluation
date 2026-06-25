; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i32 %1) {
  %3 = srem i64 %0, %0
  %4 = sext i32 %1 to i64
  %5 = udiv i64 %4, %3
  %6 = trunc i64 %4 to i32
  %7 = sext i32 %6 to i64
  %8 = or i64 %5, %7
  %9 = icmp ule i64 %3, %8
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
