; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = srem i64 %0, %0
  %4 = udiv i64 %3, %3
  %5 = sdiv exact i64 %0, %4
  %6 = or i64 %3, %5
  %7 = ashr i64 %0, %6
  %8 = urem i64 %1, %6
  %9 = and i64 %7, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
