; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %0, %1
  %5 = trunc i64 %2 to i1
  %6 = select i1 %5, i64 %4, i64 %0
  %7 = lshr i64 %4, %6
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
