; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = ashr exact i64 %1, %0
  %5 = srem i64 %0, %4
  %6 = or i64 %2, %2
  %7 = and i64 %5, %6
  %8 = trunc i64 %7 to i32
  %9 = sext i32 %8 to i64
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
