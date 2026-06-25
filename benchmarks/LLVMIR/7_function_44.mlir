; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i1 %2) {
  %4 = urem i64 %0, %0
  %5 = urem i64 %4, %1
  %6 = select i1 %2, i64 %0, i64 %4
  %7 = xor i64 %6, %5
  %8 = sdiv i64 %7, %6
  %9 = xor i64 %5, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
