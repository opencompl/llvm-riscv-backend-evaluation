; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = and i64 %0, %1
  %6 = ashr exact i64 %0, %5
  %7 = srem i64 %0, %6
  %8 = srem i64 %7, %2
  %9 = sext i32 %3 to i64
  %10 = urem i64 %9, %9
  %11 = icmp ne i64 %8, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
