; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i64 %1, i64 %2) {
  %4 = sext i32 %0 to i64
  %5 = icmp sgt i64 %4, %1
  %6 = ashr exact i64 %1, %1
  %7 = srem i64 %6, %2
  %8 = select i1 %5, i64 %1, i64 %7
  %9 = ashr exact i64 %8, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
