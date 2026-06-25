; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i1 %1, i64 %2) {
  %4 = sdiv exact i64 %0, %0
  %5 = select i1 %1, i64 %0, i64 %0
  %6 = urem i64 %4, %5
  %7 = and i64 %6, %2
  %8 = or disjoint i64 %4, %7
  ret i64 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
