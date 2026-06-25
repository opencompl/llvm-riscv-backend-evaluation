; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i32 %2, i1 %3) {
  %5 = sext i32 %2 to i64
  %6 = ashr exact i64 %1, %5
  %7 = udiv i64 %0, %6
  %8 = urem i64 %7, %0
  %9 = select i1 %3, i64 %1, i64 %0
  %10 = lshr exact i64 %9, %8
  %11 = urem i64 %8, %10
  %12 = icmp ule i64 %7, %11
  ret i1 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
