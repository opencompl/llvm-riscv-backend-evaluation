; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i32
  %5 = sext i32 %4 to i64
  %6 = ashr i64 %0, %5
  %7 = trunc i64 %6 to i32
  %8 = zext i32 %7 to i64
  %9 = xor i64 %1, %2
  %10 = xor i64 %8, %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
