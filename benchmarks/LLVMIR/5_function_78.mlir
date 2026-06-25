; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i32 %2) {
  %4 = sdiv i64 %0, %0
  %5 = lshr exact i64 %4, %1
  %6 = zext i32 %2 to i64
  %7 = srem i64 %5, %6
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
