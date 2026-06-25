; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i1 %1, i64 %2) {
  %4 = lshr exact i64 %0, %2
  %5 = select i1 %1, i64 %2, i64 %4
  %6 = udiv i64 %5, %4
  %7 = srem i64 %0, %6
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
