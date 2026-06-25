; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = or disjoint i64 %0, %1
  %4 = srem i64 %3, %1
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
