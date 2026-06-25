; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = urem i64 %0, %1
  %5 = trunc i64 %4 to i1
  %6 = udiv i64 %0, %0
  %7 = srem i64 %4, %0
  %8 = xor i64 %6, %7
  %9 = select i1 %5, i64 %2, i64 %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
