; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = sdiv exact i64 %0, %1
  %5 = trunc i64 %0 to i32
  %6 = zext i32 %5 to i64
  %7 = or i64 %1, %0
  %8 = urem i64 %2, %7
  %9 = sdiv i64 %6, %8
  %10 = srem i64 %4, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
