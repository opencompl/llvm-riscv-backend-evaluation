; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or i64 %1, %0
  %5 = or disjoint i64 %4, %0
  %6 = lshr exact i64 %5, %2
  %7 = lshr exact i64 %0, %6
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
