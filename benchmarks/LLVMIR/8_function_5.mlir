; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = ashr exact i64 %1, %1
  %5 = lshr exact i64 %1, %2
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = srem i64 %4, %7
  %9 = trunc i64 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = icmp ne i64 %0, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
