; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = sdiv i64 %0, %0
  %5 = srem i64 %4, %1
  %6 = trunc i64 %5 to i1
  %7 = select i1 %6, i64 %2, i64 %4
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
