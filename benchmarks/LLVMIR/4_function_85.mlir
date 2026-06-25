; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = or disjoint i64 %0, %1
  %4 = or i64 %3, %0
  %5 = lshr exact i64 %3, %4
  %6 = lshr i64 %5, %1
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
