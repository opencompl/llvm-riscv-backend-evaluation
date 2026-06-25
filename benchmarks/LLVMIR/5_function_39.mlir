; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i32 %0) {
  %2 = zext i32 %0 to i64
  %3 = trunc i64 %2 to i1
  %4 = xor i64 %2, %2
  %5 = select i1 %3, i64 %2, i64 %4
  %6 = trunc i64 %5 to i1
  ret i1 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
