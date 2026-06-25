; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i32 %1, i64 %2) {
  %4 = sext i32 %1 to i64
  %5 = or disjoint i64 %0, %4
  %6 = srem i64 %4, %2
  %7 = trunc i64 %6 to i32
  %8 = zext i32 %7 to i64
  %9 = urem i64 %0, %8
  %10 = urem i64 %9, %2
  %11 = sdiv exact i64 %5, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
