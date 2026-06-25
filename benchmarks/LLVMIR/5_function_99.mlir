; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i1 %0, i64 %1, i64 %2) {
  %4 = select i1 %0, i64 %1, i64 %1
  %5 = xor i64 %4, %2
  %6 = sdiv i64 %2, %2
  %7 = udiv i64 %5, %6
  %8 = trunc i64 %7 to i1
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
