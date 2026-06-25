; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = urem i64 %0, %1
  %5 = sdiv exact i64 %4, %2
  %6 = urem i64 %0, %0
  %7 = sdiv i64 %5, %6
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
