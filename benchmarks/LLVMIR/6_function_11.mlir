; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i1 %2) {
  %4 = srem i64 %0, %0
  %5 = trunc i64 %1 to i32
  %6 = sext i32 %5 to i64
  %7 = and i64 %4, %6
  %8 = select i1 %2, i64 %4, i64 %0
  %9 = lshr i64 %7, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
