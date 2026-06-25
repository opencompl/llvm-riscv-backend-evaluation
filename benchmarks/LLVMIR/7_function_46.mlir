; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = icmp sge i64 %0, %0
  %5 = ashr exact i64 %0, %0
  %6 = urem i64 %0, %2
  %7 = trunc i64 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = ashr exact i64 %1, %8
  %10 = select i1 %4, i64 %5, i64 %9
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
