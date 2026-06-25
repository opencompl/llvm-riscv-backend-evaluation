; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = lshr exact i64 %2, %1
  %5 = trunc i64 %4 to i32
  %6 = zext i32 %5 to i64
  %7 = sdiv i64 %1, %6
  %8 = udiv i64 %0, %7
  %9 = srem i64 %8, %8
  %10 = trunc i64 %9 to i1
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
