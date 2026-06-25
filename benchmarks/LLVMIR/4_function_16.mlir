; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = lshr i64 %1, %2
  %5 = xor i64 %0, %4
  %6 = srem i64 %5, %0
  %7 = icmp ule i64 %5, %6
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
