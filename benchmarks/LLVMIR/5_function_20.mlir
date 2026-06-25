; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or disjoint i64 %2, %0
  %5 = lshr i64 %1, %4
  %6 = udiv i64 %1, %5
  %7 = xor i64 %0, %6
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
