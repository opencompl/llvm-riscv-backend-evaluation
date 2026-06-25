; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i1 %1, i32 %2) {
  %4 = sext i32 %2 to i64
  %5 = select i1 %1, i64 %4, i64 %0
  %6 = urem i64 %0, %5
  %7 = trunc i64 %6 to i1
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
