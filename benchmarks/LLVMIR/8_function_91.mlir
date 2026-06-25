; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = srem i64 %0, %0
  %4 = or disjoint i64 %0, %3
  %5 = xor i64 %4, %0
  %6 = udiv i64 %4, %5
  %7 = sdiv i64 %6, %1
  %8 = trunc i64 %7 to i32
  %9 = sext i32 %8 to i64
  %10 = icmp sgt i64 %9, %4
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
