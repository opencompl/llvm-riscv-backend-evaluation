; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i32 %1, i1 %2) {
  %4 = sext i32 %1 to i64
  %5 = and i64 %0, %4
  %6 = trunc i64 %5 to i32
  %7 = zext i32 %6 to i64
  %8 = select i1 %2, i64 %4, i64 %4
  %9 = or disjoint i64 %7, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
