; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i32 %0) {
  %2 = zext i32 %0 to i64
  %3 = udiv i64 %2, %2
  %4 = trunc i64 %3 to i32
  ret i32 %4
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
