; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %0, %1
  %5 = srem i64 %4, %1
  %6 = or i64 %4, %4
  %7 = xor i64 %5, %6
  %8 = udiv i64 %1, %2
  %9 = ashr exact i64 %7, %8
  %10 = udiv i64 %4, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
