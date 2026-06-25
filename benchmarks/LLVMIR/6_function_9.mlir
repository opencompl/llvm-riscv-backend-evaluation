; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i1 %0, i64 %1, i1 %2, i32 %3) {
  %5 = sext i32 %3 to i64
  %6 = select i1 %2, i64 %5, i64 %5
  %7 = select i1 %0, i64 %1, i64 %6
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
