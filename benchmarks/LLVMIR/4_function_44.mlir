; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i32 %1) {
  %3 = sext i32 %0 to i64
  %4 = srem i64 %3, %3
  %5 = sext i32 %1 to i64
  %6 = urem i64 %4, %5
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
