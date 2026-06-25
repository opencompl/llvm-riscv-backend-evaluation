; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i1 %2) {
  %4 = urem i64 %0, %1
  %5 = select i1 %2, i64 %1, i64 %1
  %6 = icmp sgt i64 %4, %5
  %7 = or i64 %1, %1
  %8 = select i1 %6, i64 %7, i64 %4
  %9 = trunc i64 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
