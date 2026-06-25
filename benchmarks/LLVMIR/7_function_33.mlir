; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = urem i64 %0, %0
  %4 = xor i64 %1, %1
  %5 = or disjoint i64 %3, %4
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = srem i64 %7, %0
  %9 = icmp slt i64 %0, %8
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
