; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = trunc i64 %0 to i1
  %6 = select i1 %5, i64 %1, i64 %1
  %7 = sext i32 %3 to i64
  %8 = xor i64 %0, %7
  %9 = ashr exact i64 %2, %8
  %10 = and i64 %6, %9
  %11 = and i64 %10, %0
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
