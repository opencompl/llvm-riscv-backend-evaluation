; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = sdiv i64 %1, %0
  %4 = and i64 %0, %3
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = urem i64 %3, %4
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  %10 = icmp slt i64 %6, %9
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
