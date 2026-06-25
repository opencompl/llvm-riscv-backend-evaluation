; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i32 %2) {
  %4 = srem i64 %0, %1
  %5 = sext i32 %2 to i64
  %6 = udiv i64 %4, %5
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
