; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = ashr i64 %0, %1
  %5 = srem i64 %4, %2
  %6 = trunc i64 %5 to i32
  %7 = zext i32 %6 to i64
  %8 = lshr exact i64 %7, %5
  %9 = udiv i64 %4, %8
  %10 = and i64 %9, %0
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
