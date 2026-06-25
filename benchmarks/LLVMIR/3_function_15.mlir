; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = and i64 %0, %0
  %4 = or disjoint i64 %0, %3
  %5 = icmp ult i64 %4, %1
  ret i1 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
