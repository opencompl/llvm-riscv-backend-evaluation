; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or disjoint i64 %0, %1
  %5 = urem i64 %2, %2
  %6 = xor i64 %5, %0
  %7 = urem i64 %4, %6
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
