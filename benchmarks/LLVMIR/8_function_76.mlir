; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %0, %0
  %5 = sdiv i64 %4, %1
  %6 = trunc i64 %2 to i1
  %7 = select i1 %6, i64 %0, i64 %2
  %8 = srem i64 %5, %7
  %9 = trunc i64 %8 to i32
  %10 = zext i32 %9 to i64
  %11 = trunc i64 %10 to i1
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
