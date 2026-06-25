; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %0, %1
  %5 = sdiv i64 %0, %4
  %6 = ashr i64 %0, %5
  %7 = urem i64 %6, %2
  %8 = lshr exact i64 %6, %5
  %9 = or disjoint i64 %7, %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
