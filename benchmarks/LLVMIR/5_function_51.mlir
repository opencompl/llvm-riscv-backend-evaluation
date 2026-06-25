; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or disjoint i64 %1, %2
  %5 = lshr exact i64 %0, %4
  %6 = urem i64 %5, %0
  %7 = and i64 %0, %6
  %8 = trunc i64 %7 to i1
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
