; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i32 %0, i64 %1, i64 %2) {
  %4 = zext i32 %0 to i64
  %5 = xor i64 %1, %4
  %6 = xor i64 %4, %5
  %7 = or disjoint i64 %2, %4
  %8 = icmp ne i64 %6, %7
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
