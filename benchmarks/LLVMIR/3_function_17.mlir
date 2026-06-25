; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1, i64 %2) {
  %4 = sext i32 %0 to i64
  %5 = and i64 %4, %1
  %6 = and i64 %5, %2
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
