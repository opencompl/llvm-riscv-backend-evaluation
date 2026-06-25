; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = icmp sle i64 %0, %0
  %4 = xor i64 %0, %0
  %5 = urem i64 %4, %4
  %6 = and i64 %4, %1
  %7 = select i1 %3, i64 %5, i64 %6
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
