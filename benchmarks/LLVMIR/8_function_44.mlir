; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = sdiv i64 %0, %1
  %5 = trunc i64 %4 to i32
  %6 = zext i32 %5 to i64
  %7 = urem i64 %4, %4
  %8 = and i64 %2, %7
  %9 = sdiv exact i64 %1, %0
  %10 = or disjoint i64 %8, %9
  %11 = icmp sge i64 %6, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
