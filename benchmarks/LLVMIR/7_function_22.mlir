; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = lshr i64 %1, %2
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = trunc i64 %6 to i32
  %8 = zext i32 %7 to i64
  %9 = lshr i64 %0, %8
  %10 = trunc i64 %9 to i1
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
