; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i1 %1, i64 %2) {
  %4 = or i64 %0, %0
  %5 = ashr exact i64 %0, %4
  %6 = select i1 %1, i64 %2, i64 %0
  %7 = and i64 %6, %0
  %8 = or disjoint i64 %7, %6
  %9 = udiv i64 %8, %8
  %10 = or disjoint i64 %5, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
