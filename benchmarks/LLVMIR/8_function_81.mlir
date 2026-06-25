; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i1
  %5 = select i1 %4, i64 %0, i64 %1
  %6 = sdiv exact i64 %2, %1
  %7 = ashr exact i64 %5, %6
  %8 = and i64 %7, %5
  %9 = sdiv exact i64 %8, %1
  %10 = sdiv i64 %7, %9
  %11 = ashr exact i64 %8, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
