; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %1, %2
  %5 = and i64 %0, %4
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
