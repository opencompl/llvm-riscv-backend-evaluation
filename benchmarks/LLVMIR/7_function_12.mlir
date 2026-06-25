; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i32
  %5 = sext i32 %4 to i64
  %6 = ashr exact i64 %5, %0
  %7 = or i64 %2, %5
  %8 = sdiv exact i64 %5, %7
  %9 = udiv i64 %1, %8
  %10 = icmp sle i64 %6, %9
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
