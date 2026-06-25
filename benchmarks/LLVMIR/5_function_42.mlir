; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = ashr exact i64 %0, %0
  %5 = xor i64 %4, %0
  %6 = or disjoint i64 %4, %5
  %7 = udiv i64 %1, %2
  %8 = icmp eq i64 %6, %7
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
