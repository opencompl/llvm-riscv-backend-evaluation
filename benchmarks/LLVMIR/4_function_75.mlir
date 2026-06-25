; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1, i32 %2) {
  %4 = select i1 %0, i64 %1, i64 %1
  %5 = zext i32 %2 to i64
  %6 = icmp eq i64 %4, %5
  %7 = select i1 %6, i64 %1, i64 %4
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
