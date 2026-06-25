; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = xor i64 %0, %1
  %5 = sdiv i64 %2, %2
  %6 = udiv i64 %0, %5
  %7 = sdiv i64 %4, %6
  %8 = srem i64 %7, %4
  %9 = trunc i64 %8 to i1
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
