; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = or disjoint i64 %0, %1
  %4 = lshr i64 %3, %3
  %5 = urem i64 %4, %1
  %6 = trunc i64 %5 to i1
  ret i1 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
