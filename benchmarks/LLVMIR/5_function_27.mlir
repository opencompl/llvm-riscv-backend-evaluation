; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = and i64 %1, %2
  %5 = icmp sgt i64 %0, %4
  %6 = srem i64 %1, %0
  %7 = select i1 %5, i64 %2, i64 %6
  %8 = trunc i64 %7 to i1
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
