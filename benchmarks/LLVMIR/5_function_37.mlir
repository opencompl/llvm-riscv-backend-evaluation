; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i32 %2) {
  %4 = trunc i64 %0 to i1
  %5 = zext i32 %2 to i64
  %6 = or disjoint i64 %1, %5
  %7 = select i1 %4, i64 %0, i64 %6
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
