; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1, i32 %2) {
  %4 = sext i32 %2 to i64
  %5 = select i1 %0, i64 %1, i64 %4
  %6 = sdiv exact i64 %4, %4
  %7 = xor i64 %5, %6
  %8 = xor i64 %1, %6
  %9 = or i64 %7, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
