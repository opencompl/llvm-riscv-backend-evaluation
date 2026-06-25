; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = trunc i64 %0 to i32
  %4 = zext i32 %3 to i64
  %5 = zext i32 %3 to i64
  %6 = ashr exact i64 %4, %5
  %7 = lshr i64 %6, %1
  %8 = and i64 %0, %7
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
