; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1) {
  %3 = and i64 %1, %1
  %4 = udiv i64 %1, %3
  %5 = or i64 %3, %4
  %6 = select i1 %0, i64 %1, i64 %5
  %7 = trunc i64 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = and i64 %8, %1
  %10 = urem i64 %8, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
