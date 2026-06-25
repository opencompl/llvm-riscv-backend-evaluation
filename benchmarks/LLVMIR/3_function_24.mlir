; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1) {
  %3 = trunc i64 %1 to i32
  %4 = sext i32 %3 to i64
  %5 = select i1 %0, i64 %1, i64 %4
  ret i64 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
