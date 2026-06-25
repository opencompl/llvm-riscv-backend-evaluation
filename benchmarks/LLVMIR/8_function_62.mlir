; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1, i64 %2) {
  %4 = zext i32 %0 to i64
  %5 = udiv i64 %1, %2
  %6 = sdiv i64 %5, %2
  %7 = xor i64 %4, %6
  %8 = trunc i64 %2 to i32
  %9 = sext i32 %8 to i64
  %10 = ashr i64 %7, %9
  %11 = and i64 %10, %2
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
