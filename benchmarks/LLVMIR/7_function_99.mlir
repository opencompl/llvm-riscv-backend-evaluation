; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = sdiv i64 %0, %1
  %5 = and i64 %1, %2
  %6 = sdiv exact i64 %4, %5
  %7 = trunc i64 %6 to i1
  %8 = trunc i64 %4 to i32
  %9 = sext i32 %8 to i64
  %10 = select i1 %7, i64 %1, i64 %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
