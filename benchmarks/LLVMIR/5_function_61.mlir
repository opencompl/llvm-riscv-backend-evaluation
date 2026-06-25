; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i32 %0, i32 %1) {
  %3 = sext i32 %0 to i64
  %4 = zext i32 %1 to i64
  %5 = sdiv exact i64 %4, %3
  %6 = lshr i64 %3, %5
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
