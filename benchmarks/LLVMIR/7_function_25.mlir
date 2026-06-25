; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = udiv i64 %0, %1
  %6 = trunc i64 %5 to i1
  %7 = select i1 %6, i64 %2, i64 %5
  %8 = trunc i64 %7 to i1
  %9 = zext i32 %3 to i64
  %10 = urem i64 %7, %5
  %11 = select i1 %8, i64 %9, i64 %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
