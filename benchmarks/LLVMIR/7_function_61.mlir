; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i32 %2) {
  %4 = udiv i64 %0, %1
  %5 = icmp sgt i64 %4, %1
  %6 = zext i32 %2 to i64
  %7 = trunc i64 %6 to i32
  %8 = zext i32 %7 to i64
  %9 = select i1 %5, i64 %8, i64 %1
  %10 = icmp uge i64 %9, %8
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
