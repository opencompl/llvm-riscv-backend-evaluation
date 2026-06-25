; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1, i64 %2, i1 %3) {
  %5 = zext i32 %0 to i64
  %6 = or i64 %1, %2
  %7 = select i1 %3, i64 %1, i64 %2
  %8 = select i1 %3, i64 %2, i64 %7
  %9 = sdiv exact i64 %7, %5
  %10 = lshr i64 %8, %9
  %11 = urem i64 %6, %10
  %12 = udiv i64 %5, %11
  ret i64 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
