; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = lshr i64 %0, %1
  %5 = lshr i64 %4, %0
  %6 = srem i64 %0, %5
  %7 = urem i64 %2, %5
  %8 = urem i64 %6, %7
  %9 = trunc i64 %8 to i1
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
