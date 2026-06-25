; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = lshr i64 %0, %1
  %5 = trunc i64 %2 to i32
  %6 = sext i32 %5 to i64
  %7 = udiv i64 %1, %6
  %8 = ashr exact i64 %4, %7
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
