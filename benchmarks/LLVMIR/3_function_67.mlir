; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = ashr i64 %0, %0
  %4 = or disjoint i64 %1, %3
  %5 = udiv i64 %3, %4
  ret i64 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
