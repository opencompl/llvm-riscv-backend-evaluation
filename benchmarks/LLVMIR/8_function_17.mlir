; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i32 %0, i64 %1, i64 %2) {
  %4 = zext i32 %0 to i64
  %5 = urem i64 %4, %1
  %6 = urem i64 %1, %4
  %7 = sdiv exact i64 %2, %4
  %8 = and i64 %6, %7
  %9 = xor i64 %1, %8
  %10 = ashr i64 %5, %9
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
