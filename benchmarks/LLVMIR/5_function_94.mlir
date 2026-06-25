; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = and i64 %0, %1
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = lshr i64 %2, %4
  %8 = sdiv exact i64 %6, %7
  ret i64 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
