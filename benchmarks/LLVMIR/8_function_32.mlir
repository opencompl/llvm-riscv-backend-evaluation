; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i1 %0, i1 %1, i64 %2) {
  %4 = select i1 %1, i64 %2, i64 %2
  %5 = and i64 %2, %4
  %6 = lshr i64 %5, %4
  %7 = lshr i64 %4, %6
  %8 = trunc i64 %7 to i32
  %9 = sext i32 %8 to i64
  %10 = select i1 %0, i64 %9, i64 %2
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
