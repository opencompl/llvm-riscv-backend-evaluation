; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i1 %0, i64 %1, i32 %2) {
  %4 = select i1 %0, i64 %1, i64 %1
  %5 = sext i32 %2 to i64
  %6 = lshr exact i64 %4, %5
  %7 = urem i64 %4, %4
  %8 = sdiv i64 %7, %1
  %9 = icmp eq i64 %6, %8
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
