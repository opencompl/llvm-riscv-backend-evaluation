; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i1 %2, i32 %3) {
  %5 = select i1 %2, i64 %0, i64 %0
  %6 = sext i32 %3 to i64
  %7 = udiv i64 %5, %6
  %8 = and i64 %1, %7
  %9 = select i1 %2, i64 %8, i64 %0
  %10 = and i64 %8, %9
  %11 = and i64 %0, %10
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
