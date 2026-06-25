; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i1 %1, i64 %2, i32 %3) {
  %5 = select i1 %1, i64 %0, i64 %2
  %6 = sdiv exact i64 %0, %5
  %7 = sext i32 %3 to i64
  %8 = lshr exact i64 %6, %7
  %9 = lshr exact i64 %8, %7
  %10 = trunc i64 %9 to i32
  %11 = sext i32 %10 to i64
  %12 = trunc i64 %11 to i1
  ret i1 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
