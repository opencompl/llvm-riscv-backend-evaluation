; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = icmp ugt i64 %0, %1
  %5 = select i1 %4, i64 %0, i64 %0
  %6 = udiv i64 %0, %2
  %7 = sdiv i64 %5, %6
  %8 = sdiv exact i64 %7, %0
  %9 = trunc i64 %8 to i32
  %10 = zext i32 %9 to i64
  %11 = trunc i64 %10 to i1
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
