; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i1 %1) {
  %3 = select i1 %1, i64 %0, i64 %0
  %4 = urem i64 %3, %0
  %5 = or i64 %0, %4
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
