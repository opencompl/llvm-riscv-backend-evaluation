; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = and i64 %0, %1
  %5 = sdiv exact i64 %4, %2
  %6 = trunc i64 %1 to i32
  %7 = sext i32 %6 to i64
  %8 = srem i64 %5, %7
  ret i64 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
