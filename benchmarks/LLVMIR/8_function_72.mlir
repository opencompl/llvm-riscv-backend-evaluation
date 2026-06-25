; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = trunc i64 %0 to i32
  %4 = sext i32 %3 to i64
  %5 = xor i64 %0, %0
  %6 = trunc i64 %5 to i32
  %7 = zext i32 %6 to i64
  %8 = udiv i64 %7, %1
  %9 = ashr i64 %4, %8
  %10 = trunc i64 %9 to i1
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
