; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0) {
  %2 = srem i64 %0, %0
  %3 = trunc i64 %2 to i32
  %4 = zext i32 %3 to i64
  %5 = trunc i64 %4 to i1
  ret i1 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
