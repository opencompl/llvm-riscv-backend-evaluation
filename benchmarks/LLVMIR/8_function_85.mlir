; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = and i64 %0, %1
  %5 = trunc i64 %4 to i1
  %6 = trunc i64 %0 to i32
  %7 = zext i32 %6 to i64
  %8 = urem i64 %7, %2
  %9 = select i1 %5, i64 %8, i64 %8
  %10 = udiv i64 %2, %7
  %11 = icmp sgt i64 %9, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
