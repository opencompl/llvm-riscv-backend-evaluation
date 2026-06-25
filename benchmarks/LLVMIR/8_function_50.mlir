; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2, i1 %3) {
  %5 = ashr exact i64 %0, %0
  %6 = sdiv i64 %1, %2
  %7 = udiv i64 %5, %6
  %8 = or disjoint i64 %5, %7
  %9 = or i64 %8, %8
  %10 = select i1 %3, i64 %9, i64 %7
  %11 = lshr exact i64 %7, %10
  %12 = trunc i64 %11 to i1
  ret i1 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
