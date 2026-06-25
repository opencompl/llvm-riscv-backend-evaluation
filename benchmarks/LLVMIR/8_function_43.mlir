; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i32 %0, i1 %1, i64 %2) {
  %4 = sext i32 %0 to i64
  %5 = select i1 %1, i64 %2, i64 %4
  %6 = ashr exact i64 %4, %5
  %7 = trunc i64 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = urem i64 %4, %2
  %10 = udiv i64 %8, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
