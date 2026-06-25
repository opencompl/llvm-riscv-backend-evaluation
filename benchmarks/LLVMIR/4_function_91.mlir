; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = ashr exact i64 %1, %2
  %5 = or disjoint i64 %0, %4
  %6 = ashr i64 %1, %4
  %7 = sdiv i64 %5, %6
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
