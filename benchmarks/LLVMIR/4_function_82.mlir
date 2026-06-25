; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = or disjoint i64 %0, %0
  %4 = trunc i64 %1 to i32
  %5 = sext i32 %4 to i64
  %6 = xor i64 %3, %5
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
