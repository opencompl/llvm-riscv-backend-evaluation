; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i1 %0, i64 %1, i64 %2) {
  %4 = ashr i64 %2, %1
  %5 = select i1 %0, i64 %1, i64 %4
  %6 = select i1 %0, i64 %4, i64 %2
  %7 = trunc i64 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = urem i64 %5, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
