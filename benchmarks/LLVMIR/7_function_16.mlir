; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i1 %0, i64 %1, i64 %2, i32 %3) {
  %5 = select i1 %0, i64 %1, i64 %1
  %6 = sdiv i64 %5, %2
  %7 = zext i32 %3 to i64
  %8 = ashr i64 %6, %7
  %9 = trunc i64 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
