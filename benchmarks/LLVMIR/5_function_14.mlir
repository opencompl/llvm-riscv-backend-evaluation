; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = icmp uge i64 %0, %0
  %5 = urem i64 %1, %0
  %6 = or disjoint i64 %5, %5
  %7 = urem i64 %2, %6
  %8 = select i1 %4, i64 %5, i64 %7
  ret i64 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
