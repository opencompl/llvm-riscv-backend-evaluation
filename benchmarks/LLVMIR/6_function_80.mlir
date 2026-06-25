; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i1 %0, i64 %1, i32 %2) {
  %4 = zext i32 %2 to i64
  %5 = select i1 %0, i64 %1, i64 %4
  %6 = and i64 %1, %1
  %7 = xor i64 %6, %5
  %8 = lshr exact i64 %5, %7
  %9 = trunc i64 %8 to i1
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
