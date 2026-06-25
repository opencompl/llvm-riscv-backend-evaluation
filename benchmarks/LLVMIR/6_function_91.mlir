; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or disjoint i64 %0, %1
  %5 = udiv i64 %0, %2
  %6 = sdiv i64 %0, %5
  %7 = ashr i64 %4, %6
  %8 = lshr exact i64 %0, %7
  %9 = trunc i64 %8 to i1
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
