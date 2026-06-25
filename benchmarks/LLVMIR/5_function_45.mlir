; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i32 %2) {
  %4 = zext i32 %2 to i64
  %5 = sdiv exact i64 %1, %4
  %6 = xor i64 %0, %5
  %7 = or i64 %6, %1
  %8 = trunc i64 %7 to i1
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
