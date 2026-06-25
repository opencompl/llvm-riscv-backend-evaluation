; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = xor i64 %1, %1
  %5 = xor i64 %2, %1
  %6 = or disjoint i64 %4, %5
  %7 = urem i64 %0, %6
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
