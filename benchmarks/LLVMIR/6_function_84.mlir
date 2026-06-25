; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = lshr i64 %1, %0
  %6 = sdiv exact i64 %0, %5
  %7 = lshr exact i64 %6, %2
  %8 = sext i32 %3 to i64
  %9 = icmp ule i64 %7, %8
  %10 = select i1 %9, i64 %7, i64 %2
  ret i64 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
