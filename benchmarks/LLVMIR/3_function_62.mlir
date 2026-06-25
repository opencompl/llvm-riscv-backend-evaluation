; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = sdiv i64 %0, %0
  %4 = lshr i64 %3, %1
  %5 = urem i64 %4, %3
  ret i64 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
