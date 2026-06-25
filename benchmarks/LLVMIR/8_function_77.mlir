; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i1 %2) {
  %4 = trunc i64 %0 to i32
  %5 = sext i32 %4 to i64
  %6 = xor i64 %5, %1
  %7 = select i1 %2, i64 %6, i64 %0
  %8 = sdiv i64 %1, %0
  %9 = srem i64 %7, %8
  %10 = or disjoint i64 %0, %9
  %11 = xor i64 %6, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
