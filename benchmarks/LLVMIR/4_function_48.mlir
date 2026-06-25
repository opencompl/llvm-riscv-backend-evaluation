; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i32 %0) {
  %2 = zext i32 %0 to i64
  %3 = trunc i64 %2 to i32
  %4 = zext i32 %3 to i64
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
