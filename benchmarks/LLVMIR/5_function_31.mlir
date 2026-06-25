; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = lshr exact i64 %1, %2
  %6 = icmp sge i64 %0, %5
  %7 = zext i32 %3 to i64
  %8 = select i1 %6, i64 %0, i64 %7
  %9 = xor i64 %8, %1
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
