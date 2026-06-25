; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1, i64 %2) {
  %4 = select i1 %0, i64 %1, i64 %1
  %5 = xor i64 %4, %2
  %6 = srem i64 %5, %1
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
