; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = ashr exact i64 %1, %0
  %5 = lshr i64 %4, %2
  %6 = lshr i64 %5, %5
  %7 = udiv i64 %0, %6
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
