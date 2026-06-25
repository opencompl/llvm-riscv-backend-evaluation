; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i32
  %5 = zext i32 %4 to i64
  %6 = lshr exact i64 %1, %2
  %7 = urem i64 %5, %6
  %8 = lshr exact i64 %5, %7
  %9 = trunc i64 %2 to i32
  %10 = zext i32 %9 to i64
  %11 = icmp ult i64 %8, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
