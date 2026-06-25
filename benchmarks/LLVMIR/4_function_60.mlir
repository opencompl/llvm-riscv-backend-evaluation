; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0) {
  %2 = trunc i64 %0 to i32
  %3 = sext i32 %2 to i64
  %4 = trunc i64 %3 to i32
  %5 = sext i32 %4 to i64
  ret i64 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
