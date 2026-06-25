; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = trunc i64 %0 to i32
  %4 = zext i32 %3 to i64
  %5 = zext i32 %3 to i64
  %6 = lshr i64 %1, %5
  %7 = sdiv exact i64 %4, %6
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
