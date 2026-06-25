; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = sdiv i64 %0, %1
  %5 = lshr exact i64 %4, %4
  %6 = udiv i64 %5, %1
  %7 = and i64 %2, %6
  %8 = ashr i64 %2, %7
  %9 = and i64 %1, %8
  %10 = icmp slt i64 %0, %9
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
