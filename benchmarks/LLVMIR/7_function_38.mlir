; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %0, %1
  %5 = and i64 %0, %4
  %6 = urem i64 %5, %4
  %7 = icmp eq i64 %6, %2
  %8 = select i1 %7, i64 %4, i64 %5
  %9 = or i64 %8, %1
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
