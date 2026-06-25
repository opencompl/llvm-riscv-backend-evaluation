; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i1 %1, i64 %2) {
  %4 = select i1 %1, i64 %2, i64 %0
  %5 = or disjoint i64 %0, %4
  %6 = and i64 %5, %2
  %7 = ashr i64 %5, %6
  %8 = trunc i64 %7 to i1
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
