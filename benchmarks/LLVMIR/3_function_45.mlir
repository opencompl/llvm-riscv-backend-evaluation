; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0) {
  %2 = ashr i64 %0, %0
  %3 = srem i64 %2, %0
  %4 = trunc i64 %3 to i1
  ret i1 %4
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
