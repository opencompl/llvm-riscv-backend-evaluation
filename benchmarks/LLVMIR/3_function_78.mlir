; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i32 %0, i64 %1) {
  %3 = zext i32 %0 to i64
  %4 = and i64 %3, %1
  %5 = trunc i64 %4 to i1
  ret i1 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
