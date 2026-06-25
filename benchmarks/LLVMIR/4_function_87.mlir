; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0) {
  %2 = trunc i64 %0 to i32
  %3 = zext i32 %2 to i64
  %4 = and i64 %0, %3
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
