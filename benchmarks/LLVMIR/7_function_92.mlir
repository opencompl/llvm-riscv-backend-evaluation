; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i32
  %5 = sext i32 %4 to i64
  %6 = and i64 %1, %0
  %7 = xor i64 %5, %6
  %8 = trunc i64 %7 to i1
  %9 = select i1 %8, i64 %2, i64 %5
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
