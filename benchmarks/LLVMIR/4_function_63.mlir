; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i1 %0, i64 %1, i64 %2) {
  %4 = select i1 %0, i64 %1, i64 %2
  %5 = ashr exact i64 %2, %2
  %6 = srem i64 %1, %5
  %7 = icmp ne i64 %4, %6
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
