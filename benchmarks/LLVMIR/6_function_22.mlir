; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or disjoint i64 %1, %2
  %5 = srem i64 %0, %4
  %6 = srem i64 %5, %0
  %7 = trunc i64 %6 to i32
  %8 = zext i32 %7 to i64
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
