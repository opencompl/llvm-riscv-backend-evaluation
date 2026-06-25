; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = or disjoint i64 %0, %1
  %6 = and i64 %0, %5
  %7 = xor i64 %6, %2
  %8 = and i64 %1, %1
  %9 = zext i32 %3 to i64
  %10 = and i64 %9, %0
  %11 = or i64 %8, %10
  %12 = icmp eq i64 %7, %11
  ret i1 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
