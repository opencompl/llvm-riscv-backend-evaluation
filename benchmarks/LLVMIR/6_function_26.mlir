; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i1 %1, i64 %2) {
  %4 = select i1 %1, i64 %2, i64 %2
  %5 = trunc i64 %4 to i32
  %6 = zext i32 %5 to i64
  %7 = trunc i64 %6 to i32
  %8 = zext i32 %7 to i64
  %9 = srem i64 %0, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
