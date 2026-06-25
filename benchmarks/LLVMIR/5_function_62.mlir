; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i1 %2) {
  %4 = lshr exact i64 %0, %1
  %5 = select i1 %2, i64 %4, i64 %0
  %6 = or i64 %0, %5
  %7 = srem i64 %4, %6
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
