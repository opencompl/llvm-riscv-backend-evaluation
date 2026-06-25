; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1, i32 %2) {
  %4 = zext i32 %2 to i64
  %5 = lshr i64 %1, %4
  %6 = select i1 %0, i64 %5, i64 %5
  %7 = or disjoint i64 %6, %6
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
