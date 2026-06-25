; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i32 %0, i64 %1) {
  %3 = zext i32 %0 to i64
  %4 = lshr i64 %1, %3
  %5 = udiv i64 %3, %4
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
