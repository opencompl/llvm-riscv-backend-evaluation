; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = srem i64 %0, %0
  %4 = or disjoint i64 %0, %3
  %5 = or i64 %1, %0
  %6 = udiv i64 %4, %5
  %7 = urem i64 %0, %6
  %8 = trunc i64 %7 to i1
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
