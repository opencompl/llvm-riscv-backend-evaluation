; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i1 %1, i32 %2) {
  %4 = sext i32 %2 to i64
  %5 = select i1 %1, i64 %0, i64 %4
  %6 = and i64 %0, %5
  %7 = lshr exact i64 %6, %0
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
