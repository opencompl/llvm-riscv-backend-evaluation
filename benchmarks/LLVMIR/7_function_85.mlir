; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i1 %0, i64 %1, i64 %2) {
  %4 = select i1 %0, i64 %1, i64 %1
  %5 = xor i64 %4, %2
  %6 = xor i64 %5, %5
  %7 = and i64 %4, %6
  %8 = xor i64 %4, %2
  %9 = urem i64 %7, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
