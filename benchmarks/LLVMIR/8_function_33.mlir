; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = urem i64 %0, %1
  %5 = urem i64 %4, %2
  %6 = lshr i64 %5, %4
  %7 = trunc i64 %1 to i1
  %8 = select i1 %7, i64 %6, i64 %5
  %9 = urem i64 %6, %8
  %10 = and i64 %5, %9
  %11 = trunc i64 %10 to i1
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
