; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i32
  %5 = zext i32 %4 to i64
  %6 = srem i64 %5, %2
  %7 = or i64 %1, %6
  %8 = sext i32 %4 to i64
  %9 = and i64 %7, %8
  %10 = udiv i64 %5, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
