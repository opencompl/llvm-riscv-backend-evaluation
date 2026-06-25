; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = srem i64 %0, %0
  %4 = ashr i64 %3, %0
  %5 = trunc i64 %4 to i32
  %6 = zext i32 %5 to i64
  %7 = udiv i64 %4, %1
  %8 = lshr exact i64 %6, %7
  ret i64 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
