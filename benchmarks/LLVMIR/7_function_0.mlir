; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i1 %0, i64 %1, i64 %2) {
  %4 = select i1 %0, i64 %1, i64 %2
  %5 = trunc i64 %2 to i1
  %6 = select i1 %5, i64 %2, i64 %4
  %7 = or disjoint i64 %4, %6
  %8 = select i1 %5, i64 %1, i64 %4
  %9 = sdiv i64 %7, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
