; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1) {
  %3 = zext i32 %0 to i64
  %4 = or i64 %1, %3
  %5 = xor i64 %3, %4
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
