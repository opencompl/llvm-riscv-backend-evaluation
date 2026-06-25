; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i1 %1, i64 %2) {
  %4 = select i1 %1, i64 %0, i64 %0
  %5 = srem i64 %0, %4
  %6 = select i1 %1, i64 %2, i64 %0
  %7 = sdiv i64 %5, %6
  %8 = urem i64 %7, %5
  %9 = or i64 %8, %5
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
