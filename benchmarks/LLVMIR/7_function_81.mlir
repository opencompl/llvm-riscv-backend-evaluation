; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1, i64 %2) {
  %4 = zext i32 %0 to i64
  %5 = lshr exact i64 %4, %1
  %6 = lshr exact i64 %4, %5
  %7 = zext i32 %0 to i64
  %8 = xor i64 %2, %7
  %9 = srem i64 %5, %8
  %10 = or disjoint i64 %6, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
