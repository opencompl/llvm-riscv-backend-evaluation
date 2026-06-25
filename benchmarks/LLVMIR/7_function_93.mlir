; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i32 %0, i64 %1, i64 %2) {
  %4 = sext i32 %0 to i64
  %5 = udiv i64 %4, %1
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = xor i64 %1, %2
  %9 = udiv i64 %7, %8
  %10 = trunc i64 %9 to i1
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
