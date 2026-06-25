; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2, i1 %3) {
  %5 = sdiv exact i64 %0, %0
  %6 = ashr i64 %5, %0
  %7 = xor i64 %6, %1
  %8 = and i64 %7, %2
  %9 = select i1 %3, i64 %6, i64 %8
  %10 = udiv i64 %9, %5
  %11 = udiv i64 %8, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
