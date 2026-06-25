; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0) {
  %2 = srem i64 %0, %0
  %3 = lshr exact i64 %0, %2
  %4 = or i64 %0, %3
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = srem i64 %4, %2
  %8 = urem i64 %6, %7
  ret i64 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
