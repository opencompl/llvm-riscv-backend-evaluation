; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = and i64 %0, %1
  %4 = xor i64 %3, %0
  %5 = trunc i64 %4 to i32
  %6 = zext i32 %5 to i64
  %7 = trunc i64 %6 to i1
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
