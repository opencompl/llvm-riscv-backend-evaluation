; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i32 %1) {
  %3 = icmp ugt i64 %0, %0
  %4 = zext i32 %1 to i64
  %5 = trunc i64 %4 to i32
  %6 = zext i32 %5 to i64
  %7 = select i1 %3, i64 %0, i64 %6
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
