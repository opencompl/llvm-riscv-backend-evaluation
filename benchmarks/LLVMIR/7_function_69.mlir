; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1, i64 %2) {
  %4 = select i1 %0, i64 %1, i64 %2
  %5 = and i64 %1, %2
  %6 = ashr i64 %4, %5
  %7 = trunc i64 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = or i64 %8, %1
  %10 = or i64 %6, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
