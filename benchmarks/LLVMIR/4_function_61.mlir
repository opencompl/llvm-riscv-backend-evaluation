; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = or i64 %0, %1
  %4 = sdiv exact i64 %3, %0
  %5 = or i64 %4, %4
  %6 = or disjoint i64 %5, %0
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
