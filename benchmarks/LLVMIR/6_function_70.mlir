; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i1 %1, i64 %2) {
  %4 = urem i64 %0, %0
  %5 = urem i64 %4, %4
  %6 = select i1 %1, i64 %2, i64 %2
  %7 = ashr exact i64 %5, %6
  %8 = urem i64 %6, %2
  %9 = and i64 %7, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
