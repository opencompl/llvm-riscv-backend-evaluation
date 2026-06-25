; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %0, %1
  %5 = or i64 %4, %2
  %6 = udiv i64 %2, %4
  %7 = sdiv exact i64 %5, %6
  %8 = udiv i64 %0, %7
  %9 = urem i64 %4, %8
  %10 = trunc i64 %9 to i32
  %11 = zext i32 %10 to i64
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
