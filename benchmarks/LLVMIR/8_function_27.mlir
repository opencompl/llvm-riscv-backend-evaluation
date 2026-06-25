; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i1 %1, i64 %2) {
  %4 = select i1 %1, i64 %0, i64 %2
  %5 = ashr exact i64 %4, %0
  %6 = and i64 %0, %5
  %7 = lshr exact i64 %0, %0
  %8 = ashr exact i64 %6, %7
  %9 = trunc i64 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = urem i64 %0, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
