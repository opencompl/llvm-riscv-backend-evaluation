; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = xor i64 %1, %2
  %5 = udiv i64 %1, %4
  %6 = and i64 %4, %5
  %7 = ashr exact i64 %6, %1
  %8 = urem i64 %0, %7
  ret i64 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
