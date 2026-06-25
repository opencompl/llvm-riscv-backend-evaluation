; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = ashr i64 %0, %1
  %5 = ashr i64 %4, %2
  %6 = trunc i64 %5 to i1
  ret i1 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
