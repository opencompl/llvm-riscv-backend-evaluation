; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1) {
  %3 = zext i32 %0 to i64
  %4 = and i64 %3, %3
  %5 = trunc i64 %1 to i32
  %6 = sext i32 %5 to i64
  %7 = trunc i64 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = or i64 %4, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
