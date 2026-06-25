; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i1 %1, i64 %2) {
  %4 = srem i64 %2, %2
  %5 = select i1 %1, i64 %4, i64 %4
  %6 = srem i64 %2, %5
  %7 = select i1 %0, i64 %5, i64 %6
  %8 = trunc i64 %7 to i1
  %9 = select i1 %8, i64 %5, i64 %7
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
