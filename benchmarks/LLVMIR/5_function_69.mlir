; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or i64 %1, %2
  %5 = or i64 %2, %1
  %6 = sdiv exact i64 %4, %5
  %7 = and i64 %6, %1
  %8 = icmp ugt i64 %0, %7
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
