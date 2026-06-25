; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2, i1 %3) {
  %5 = udiv i64 %0, %1
  %6 = udiv i64 %5, %5
  %7 = udiv i64 %6, %2
  %8 = or i64 %7, %0
  %9 = select i1 %3, i64 %5, i64 %1
  %10 = or i64 %8, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
