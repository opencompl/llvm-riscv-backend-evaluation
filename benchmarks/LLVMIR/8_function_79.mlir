; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i1 %2) {
  %4 = udiv i64 %0, %0
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = select i1 %2, i64 %0, i64 %1
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  %10 = sdiv exact i64 %1, %9
  %11 = icmp ult i64 %6, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
