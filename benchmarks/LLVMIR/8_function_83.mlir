; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = udiv i64 %0, %0
  %4 = sdiv exact i64 %0, %1
  %5 = urem i64 %3, %4
  %6 = ashr exact i64 %3, %4
  %7 = trunc i64 %6 to i32
  %8 = sext i32 %7 to i64
  %9 = lshr exact i64 %5, %8
  %10 = trunc i64 %9 to i1
  ret i1 %10
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
