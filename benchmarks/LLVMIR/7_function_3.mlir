; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i32 %2) {
  %4 = sdiv i64 %0, %0
  %5 = or i64 %4, %1
  %6 = zext i32 %2 to i64
  %7 = srem i64 %5, %6
  %8 = sext i32 %2 to i64
  %9 = ashr i64 %8, %8
  %10 = udiv i64 %7, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
