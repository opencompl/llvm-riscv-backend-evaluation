; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i1 %2) {
  %4 = xor i64 %0, %0
  %5 = trunc i64 %4 to i1
  %6 = select i1 %5, i64 %0, i64 %1
  %7 = select i1 %2, i64 %4, i64 %1
  %8 = srem i64 %6, %7
  %9 = trunc i64 %8 to i1
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
