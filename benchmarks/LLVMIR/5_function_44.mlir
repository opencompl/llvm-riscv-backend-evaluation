; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = xor i64 %0, %1
  %5 = or disjoint i64 %4, %2
  %6 = or i64 %0, %5
  %7 = trunc i64 %6 to i32
  %8 = zext i32 %7 to i64
  ret i64 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
