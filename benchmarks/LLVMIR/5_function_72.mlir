; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0) {
  %2 = trunc i64 %0 to i32
  %3 = zext i32 %2 to i64
  %4 = srem i64 %0, %3
  %5 = or i64 %0, %4
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
