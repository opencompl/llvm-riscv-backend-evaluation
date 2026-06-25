; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = lshr i64 %0, %0
  %5 = udiv i64 %4, %1
  %6 = udiv i64 %5, %2
  %7 = lshr i64 %0, %6
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
