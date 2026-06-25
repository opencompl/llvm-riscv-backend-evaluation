; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i1 %1, i64 %2) {
  %4 = trunc i64 %0 to i32
  %5 = zext i32 %4 to i64
  %6 = xor i64 %5, %5
  %7 = select i1 %1, i64 %6, i64 %2
  %8 = icmp slt i64 %6, %7
  %9 = select i1 %8, i64 %0, i64 %5
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
