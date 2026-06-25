; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = icmp eq i64 %0, %0
  %6 = srem i64 %1, %2
  %7 = zext i32 %3 to i64
  %8 = sdiv exact i64 %7, %1
  %9 = select i1 %5, i64 %6, i64 %8
  %10 = trunc i64 %9 to i32
  ret i32 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
