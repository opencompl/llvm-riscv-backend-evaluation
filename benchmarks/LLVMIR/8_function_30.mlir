; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i32 %1, i64 %2) {
  %4 = xor i64 %0, %0
  %5 = zext i32 %1 to i64
  %6 = and i64 %4, %5
  %7 = ashr i64 %0, %6
  %8 = and i64 %7, %2
  %9 = lshr i64 %6, %8
  %10 = ashr i64 %7, %9
  %11 = icmp slt i64 %6, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
