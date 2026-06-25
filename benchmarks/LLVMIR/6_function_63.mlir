; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0) {
  %2 = xor i64 %0, %0
  %3 = trunc i64 %2 to i32
  %4 = sext i32 %3 to i64
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
