; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = xor i64 %0, %1
  %4 = udiv i64 %0, %3
  %5 = xor i64 %3, %3
  %6 = ashr i64 %4, %5
  %7 = trunc i64 %6 to i1
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
