; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1, i1 %2) {
  %4 = srem i64 %1, %1
  %5 = select i1 %2, i64 %4, i64 %1
  %6 = select i1 %0, i64 %1, i64 %5
  %7 = srem i64 %6, %4
  %8 = trunc i64 %7 to i32
  %9 = sext i32 %8 to i64
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
