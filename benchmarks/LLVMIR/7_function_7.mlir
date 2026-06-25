; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = lshr exact i64 %2, %0
  %6 = and i64 %1, %5
  %7 = lshr exact i64 %0, %6
  %8 = urem i64 %7, %6
  %9 = sext i32 %3 to i64
  %10 = or i64 %9, %8
  %11 = icmp ult i64 %8, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
