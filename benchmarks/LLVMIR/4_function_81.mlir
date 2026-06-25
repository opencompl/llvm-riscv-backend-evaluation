; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %0, %1
  %5 = or disjoint i64 %2, %1
  %6 = xor i64 %4, %5
  %7 = srem i64 %6, %5
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
