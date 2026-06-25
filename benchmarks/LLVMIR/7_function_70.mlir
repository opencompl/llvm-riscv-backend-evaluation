; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = ashr exact i64 %0, %0
  %4 = sdiv exact i64 %0, %3
  %5 = srem i64 %0, %1
  %6 = trunc i64 %5 to i32
  %7 = zext i32 %6 to i64
  %8 = xor i64 %4, %7
  %9 = trunc i64 %8 to i1
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
