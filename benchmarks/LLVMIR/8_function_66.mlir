; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %0, %0
  %5 = trunc i64 %1 to i32
  %6 = sext i32 %5 to i64
  %7 = sdiv exact i64 %4, %2
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  %10 = srem i64 %6, %9
  %11 = and i64 %4, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
