; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i1 %2) {
  %4 = or disjoint i64 %0, %1
  %5 = select i1 %2, i64 %0, i64 %4
  %6 = lshr i64 %4, %5
  %7 = trunc i64 %6 to i1
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
