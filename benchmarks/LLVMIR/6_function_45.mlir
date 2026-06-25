; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i1 %1) {
  %3 = trunc i64 %0 to i32
  %4 = sext i32 %3 to i64
  %5 = select i1 %1, i64 %4, i64 %4
  %6 = trunc i64 %5 to i32
  %7 = zext i32 %6 to i64
  %8 = icmp sgt i64 %4, %7
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
