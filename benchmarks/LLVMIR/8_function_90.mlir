; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = and i64 %0, %0
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = icmp eq i64 %0, %6
  %8 = select i1 %7, i64 %1, i64 %2
  %9 = trunc i64 %8 to i32
  %10 = zext i32 %9 to i64
  %11 = trunc i64 %10 to i32
  ret i32 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
