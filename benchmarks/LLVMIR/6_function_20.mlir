; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = srem i64 %0, %0
  %4 = trunc i64 %3 to i32
  %5 = sext i32 %4 to i64
  %6 = and i64 %0, %5
  %7 = srem i64 %6, %1
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
