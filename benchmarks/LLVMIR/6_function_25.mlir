; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1, i64 %2) {
  %4 = sext i32 %0 to i64
  %5 = srem i64 %4, %1
  %6 = urem i64 %4, %5
  %7 = trunc i64 %2 to i32
  %8 = sext i32 %7 to i64
  %9 = ashr i64 %6, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
