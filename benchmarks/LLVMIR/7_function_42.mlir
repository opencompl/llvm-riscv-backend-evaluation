; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = xor i64 %0, %0
  %5 = ashr i64 %1, %2
  %6 = ashr i64 %4, %5
  %7 = xor i64 %1, %0
  %8 = ashr exact i64 %6, %7
  %9 = trunc i64 %8 to i32
  %10 = zext i32 %9 to i64
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
