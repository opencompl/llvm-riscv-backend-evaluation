; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1, i64 %2) {
  %4 = sext i32 %0 to i64
  %5 = udiv i64 %1, %2
  %6 = icmp uge i64 %5, %1
  %7 = select i1 %6, i64 %1, i64 %5
  %8 = and i64 %4, %7
  %9 = xor i64 %7, %8
  %10 = udiv i64 %8, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
