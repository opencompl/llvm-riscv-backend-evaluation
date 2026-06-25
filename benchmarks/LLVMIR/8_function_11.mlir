; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = lshr i64 %0, %1
  %6 = ashr i64 %0, %2
  %7 = urem i64 %0, %6
  %8 = urem i64 %7, %5
  %9 = sdiv i64 %5, %8
  %10 = zext i32 %3 to i64
  %11 = and i64 %9, %10
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
