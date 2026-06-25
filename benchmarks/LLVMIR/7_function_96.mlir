; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = ashr exact i64 %0, %0
  %4 = ashr i64 %3, %0
  %5 = ashr exact i64 %0, %4
  %6 = sdiv i64 %0, %5
  %7 = xor i64 %3, %1
  %8 = xor i64 %6, %7
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
