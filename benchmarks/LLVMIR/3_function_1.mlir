; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i32 %0) {
  %2 = sext i32 %0 to i64
  %3 = urem i64 %2, %2
  %4 = trunc i64 %3 to i1
  ret i1 %4
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
