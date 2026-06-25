; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i32 %1) {
  %3 = sext i32 %1 to i64
  %4 = or disjoint i64 %0, %3
  %5 = urem i64 %0, %4
  %6 = icmp ule i64 %5, %5
  ret i1 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
