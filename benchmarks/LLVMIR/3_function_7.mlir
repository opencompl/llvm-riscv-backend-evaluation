; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = lshr i64 %2, %2
  %5 = lshr exact i64 %1, %4
  %6 = lshr i64 %0, %5
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
