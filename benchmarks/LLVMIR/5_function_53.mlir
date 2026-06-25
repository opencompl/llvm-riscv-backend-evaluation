; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = srem i64 %0, %0
  %4 = icmp eq i64 %3, %3
  %5 = select i1 %4, i64 %0, i64 %1
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
