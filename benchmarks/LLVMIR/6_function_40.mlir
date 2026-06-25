; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = urem i64 %0, %0
  %5 = udiv i64 %4, %1
  %6 = srem i64 %4, %5
  %7 = xor i64 %6, %2
  %8 = udiv i64 %4, %7
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
