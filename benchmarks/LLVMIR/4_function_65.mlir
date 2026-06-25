; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0) {
  %2 = srem i64 %0, %0
  %3 = urem i64 %0, %2
  %4 = xor i64 %3, %3
  %5 = icmp ult i64 %3, %4
  ret i1 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
