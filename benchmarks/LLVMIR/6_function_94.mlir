; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1, i64 %2) {
  %4 = select i1 %0, i64 %1, i64 %2
  %5 = select i1 %0, i64 %2, i64 %2
  %6 = urem i64 %5, %5
  %7 = or i64 %6, %5
  %8 = udiv i64 %7, %4
  %9 = sdiv i64 %4, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
