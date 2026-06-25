; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i1 %0, i64 %1, i64 %2, i32 %3) {
  %5 = urem i64 %1, %2
  %6 = zext i32 %3 to i64
  %7 = urem i64 %6, %6
  %8 = xor i64 %1, %7
  %9 = srem i64 %8, %5
  %10 = sdiv exact i64 %1, %9
  %11 = select i1 %0, i64 %5, i64 %10
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
