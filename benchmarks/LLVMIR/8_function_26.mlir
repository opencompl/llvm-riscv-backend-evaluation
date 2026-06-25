; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i32 %1, i64 %2) {
  %4 = and i64 %0, %0
  %5 = sext i32 %1 to i64
  %6 = udiv i64 %0, %5
  %7 = and i64 %6, %2
  %8 = ashr exact i64 %7, %6
  %9 = udiv i64 %6, %8
  %10 = ashr i64 %4, %9
  %11 = sdiv i64 %10, %8
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
