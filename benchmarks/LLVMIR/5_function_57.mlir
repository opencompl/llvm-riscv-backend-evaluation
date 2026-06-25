; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = lshr exact i64 %1, %0
  %5 = and i64 %0, %4
  %6 = ashr i64 %0, %5
  %7 = trunc i64 %6 to i1
  %8 = select i1 %7, i64 %2, i64 %1
  ret i64 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
