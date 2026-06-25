; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i1 %0, i32 %1, i64 %2) {
  %4 = zext i32 %1 to i64
  %5 = select i1 %0, i64 %4, i64 %2
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
