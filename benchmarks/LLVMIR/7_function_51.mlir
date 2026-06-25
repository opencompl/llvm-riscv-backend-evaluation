; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2, i1 %3) {
  %5 = or i64 %0, %1
  %6 = select i1 %3, i64 %1, i64 %2
  %7 = select i1 %3, i64 %6, i64 %1
  %8 = udiv i64 %7, %6
  %9 = xor i64 %2, %8
  %10 = udiv i64 %2, %9
  %11 = icmp uge i64 %5, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
