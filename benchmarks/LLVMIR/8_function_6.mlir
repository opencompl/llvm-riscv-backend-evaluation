; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1, i64 %2, i1 %3) {
  %5 = zext i32 %0 to i64
  %6 = select i1 %3, i64 %2, i64 %5
  %7 = or i64 %2, %6
  %8 = srem i64 %7, %6
  %9 = xor i64 %7, %8
  %10 = udiv i64 %9, %7
  %11 = srem i64 %1, %10
  %12 = ashr exact i64 %5, %11
  ret i64 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
