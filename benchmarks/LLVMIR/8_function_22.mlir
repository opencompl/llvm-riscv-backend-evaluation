; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i1
  %5 = lshr i64 %0, %0
  %6 = ashr exact i64 %5, %2
  %7 = urem i64 %1, %6
  %8 = lshr i64 %2, %1
  %9 = select i1 %4, i64 %8, i64 %0
  %10 = select i1 %4, i64 %7, i64 %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
