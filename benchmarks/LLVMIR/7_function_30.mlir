; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i1 %0, i64 %1) {
  %3 = trunc i64 %1 to i32
  %4 = sext i32 %3 to i64
  %5 = select i1 %0, i64 %4, i64 %4
  %6 = lshr exact i64 %4, %1
  %7 = and i64 %5, %6
  %8 = urem i64 %5, %7
  %9 = trunc i64 %8 to i1
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
