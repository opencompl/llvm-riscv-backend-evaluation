; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1, i64 %2, i1 %3) {
  %5 = sext i32 %0 to i64
  %6 = and i64 %1, %5
  %7 = urem i64 %5, %6
  %8 = select i1 %3, i64 %6, i64 %7
  %9 = and i64 %1, %8
  %10 = and i64 %7, %9
  %11 = urem i64 %2, %10
  %12 = or i64 %7, %11
  ret i64 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
