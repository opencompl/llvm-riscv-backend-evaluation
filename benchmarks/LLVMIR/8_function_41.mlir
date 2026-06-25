; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = icmp sge i64 %0, %1
  %5 = select i1 %4, i64 %2, i64 %0
  %6 = ashr exact i64 %2, %5
  %7 = and i64 %0, %6
  %8 = xor i64 %5, %7
  %9 = urem i64 %5, %8
  %10 = select i1 %4, i64 %7, i64 %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
