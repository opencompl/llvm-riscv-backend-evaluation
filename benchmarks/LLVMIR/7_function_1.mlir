; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i32 %2) {
  %4 = srem i64 %0, %1
  %5 = zext i32 %2 to i64
  %6 = sdiv i64 %5, %0
  %7 = lshr exact i64 %4, %6
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  %10 = trunc i64 %9 to i1
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
