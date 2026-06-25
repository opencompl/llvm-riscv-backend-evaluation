; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = and i64 %0, %1
  %5 = lshr i64 %2, %2
  %6 = udiv i64 %4, %5
  %7 = trunc i64 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = sdiv i64 %8, %0
  %10 = trunc i64 %9 to i1
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
