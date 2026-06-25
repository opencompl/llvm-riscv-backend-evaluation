; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = icmp eq i64 %2, %0
  %6 = sext i32 %3 to i64
  %7 = select i1 %5, i64 %6, i64 %0
  %8 = urem i64 %1, %7
  %9 = and i64 %0, %8
  %10 = trunc i64 %9 to i1
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
