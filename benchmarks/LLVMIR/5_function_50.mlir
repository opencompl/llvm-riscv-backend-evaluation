; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = lshr i64 %0, %1
  %4 = and i64 %3, %0
  %5 = trunc i64 %4 to i32
  %6 = zext i32 %5 to i64
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
