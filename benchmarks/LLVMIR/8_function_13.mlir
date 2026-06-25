; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = urem i64 %0, %0
  %4 = trunc i64 %3 to i32
  %5 = sext i32 %4 to i64
  %6 = or disjoint i64 %3, %1
  %7 = and i64 %0, %6
  %8 = xor i64 %5, %7
  %9 = trunc i64 %8 to i32
  %10 = zext i32 %9 to i64
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
