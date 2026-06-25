; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %0, %0
  %5 = and i64 %4, %4
  %6 = trunc i64 %5 to i1
  %7 = udiv i64 %0, %0
  %8 = or i64 %7, %5
  %9 = and i64 %1, %2
  %10 = select i1 %6, i64 %8, i64 %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
