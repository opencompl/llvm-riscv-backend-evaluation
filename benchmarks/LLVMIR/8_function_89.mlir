; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = xor i64 %0, %1
  %4 = and i64 %1, %0
  %5 = sdiv exact i64 %3, %4
  %6 = trunc i64 %5 to i32
  %7 = zext i32 %6 to i64
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
