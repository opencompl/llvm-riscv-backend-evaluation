; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = trunc i64 %0 to i1
  %4 = and i64 %0, %0
  %5 = select i1 %3, i64 %4, i64 %4
  %6 = lshr exact i64 %5, %1
  %7 = or i64 %6, %1
  %8 = trunc i64 %7 to i32
  %9 = sext i32 %8 to i64
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
