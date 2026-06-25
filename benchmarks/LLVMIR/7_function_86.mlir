; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i32 %1, i64 %2) {
  %4 = sext i32 %1 to i64
  %5 = or disjoint i64 %4, %4
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = srem i64 %7, %2
  %9 = udiv i64 %0, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
