; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %0, %1
  %5 = and i64 %0, %4
  %6 = and i64 %2, %1
  %7 = or i64 %5, %6
  %8 = trunc i64 %7 to i32
  %9 = sext i32 %8 to i64
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
