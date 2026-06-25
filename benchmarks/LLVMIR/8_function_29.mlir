; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2, i1 %3) {
  %5 = and i64 %0, %1
  %6 = srem i64 %2, %0
  %7 = xor i64 %5, %6
  %8 = xor i64 %2, %1
  %9 = select i1 %3, i64 %5, i64 %8
  %10 = srem i64 %7, %9
  %11 = lshr i64 %10, %0
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
