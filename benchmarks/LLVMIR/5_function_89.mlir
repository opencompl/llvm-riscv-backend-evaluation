; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i1 %0, i64 %1, i64 %2) {
  %4 = ashr i64 %1, %2
  %5 = select i1 %0, i64 %4, i64 %2
  %6 = select i1 %0, i64 %2, i64 %2
  %7 = and i64 %5, %6
  %8 = trunc i64 %7 to i1
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
