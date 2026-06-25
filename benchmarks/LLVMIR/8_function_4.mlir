; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2, i1 %3) {
  %5 = udiv i64 %0, %1
  %6 = lshr exact i64 %2, %1
  %7 = ashr exact i64 %5, %6
  %8 = select i1 %3, i64 %2, i64 %0
  %9 = ashr i64 %8, %7
  %10 = or i64 %7, %9
  %11 = urem i64 %2, %10
  %12 = icmp ult i64 %10, %11
  ret i1 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
