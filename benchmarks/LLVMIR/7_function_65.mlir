; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i32 %0, i64 %1, i64 %2) {
  %4 = sext i32 %0 to i64
  %5 = and i64 %4, %1
  %6 = and i64 %5, %1
  %7 = sdiv i64 %5, %6
  %8 = ashr i64 %5, %7
  %9 = srem i64 %8, %2
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
