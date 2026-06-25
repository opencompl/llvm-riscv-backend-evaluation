; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = sdiv exact i64 %0, %1
  %5 = trunc i64 %4 to i1
  %6 = lshr i64 %4, %2
  %7 = trunc i64 %6 to i32
  %8 = zext i32 %7 to i64
  %9 = srem i64 %4, %8
  %10 = lshr exact i64 %9, %6
  %11 = select i1 %5, i64 %2, i64 %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
