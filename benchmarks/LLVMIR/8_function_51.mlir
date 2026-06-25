; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = ashr i64 %0, %1
  %6 = and i64 %5, %5
  %7 = or disjoint i64 %5, %6
  %8 = xor i64 %2, %2
  %9 = zext i32 %3 to i64
  %10 = lshr exact i64 %8, %9
  %11 = sdiv exact i64 %7, %10
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
