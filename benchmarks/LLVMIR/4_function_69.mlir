; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1) {
  %3 = urem i64 %1, %1
  %4 = ashr exact i64 %1, %3
  %5 = lshr i64 %4, %1
  %6 = select i1 %0, i64 %5, i64 %5
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
