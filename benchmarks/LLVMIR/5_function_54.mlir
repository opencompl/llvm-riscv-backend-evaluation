; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = xor i64 %0, %0
  %4 = sdiv exact i64 %0, %1
  %5 = udiv i64 %3, %4
  %6 = and i64 %5, %3
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
