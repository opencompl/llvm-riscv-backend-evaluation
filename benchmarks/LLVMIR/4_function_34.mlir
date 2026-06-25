; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = udiv i64 %0, %0
  %4 = ashr exact i64 %3, %1
  %5 = or i64 %3, %4
  %6 = lshr i64 %3, %5
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
