; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i32 %0, i64 %1) {
  %3 = zext i32 %0 to i64
  %4 = and i64 %3, %1
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = trunc i64 %6 to i32
  %8 = zext i32 %7 to i64
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
