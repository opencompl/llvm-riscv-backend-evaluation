; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = sdiv exact i64 %2, %1
  %5 = udiv i64 %1, %4
  %6 = sdiv exact i64 %5, %5
  %7 = or disjoint i64 %0, %6
  %8 = trunc i64 %7 to i1
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
