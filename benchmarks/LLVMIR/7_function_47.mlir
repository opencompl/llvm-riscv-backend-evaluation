; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2, i1 %3) {
  %5 = trunc i64 %0 to i32
  %6 = zext i32 %5 to i64
  %7 = ashr i64 %1, %2
  %8 = xor i64 %6, %7
  %9 = select i1 %3, i64 %0, i64 %6
  %10 = xor i64 %8, %9
  %11 = trunc i64 %10 to i1
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
