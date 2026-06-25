; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = icmp ule i64 %0, %1
  %6 = or i64 %0, %1
  %7 = udiv i64 %1, %2
  %8 = xor i64 %6, %7
  %9 = xor i64 %0, %8
  %10 = and i64 %8, %9
  %11 = zext i32 %3 to i64
  %12 = select i1 %5, i64 %10, i64 %11
  ret i64 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
