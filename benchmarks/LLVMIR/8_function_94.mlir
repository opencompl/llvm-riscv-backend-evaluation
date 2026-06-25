; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = sdiv exact i64 %0, %1
  %6 = icmp sgt i64 %5, %1
  %7 = ashr exact i64 %2, %5
  %8 = sext i32 %3 to i64
  %9 = srem i64 %7, %8
  %10 = select i1 %6, i64 %5, i64 %9
  %11 = srem i64 %2, %8
  %12 = ashr exact i64 %10, %11
  ret i64 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
