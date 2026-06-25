; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = and i64 %0, %1
  %5 = udiv i64 %4, %1
  %6 = icmp ule i64 %5, %2
  %7 = select i1 %6, i64 %5, i64 %0
  %8 = trunc i64 %7 to i32
  %9 = sext i32 %8 to i64
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
