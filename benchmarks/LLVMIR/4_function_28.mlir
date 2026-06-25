; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1) {
  %3 = zext i32 %0 to i64
  %4 = srem i64 %1, %1
  %5 = or i64 %3, %4
  %6 = sdiv i64 %3, %5
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
