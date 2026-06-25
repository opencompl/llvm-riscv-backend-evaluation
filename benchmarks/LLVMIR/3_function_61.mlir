; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = urem i64 %0, %0
  %4 = sdiv exact i64 %0, %3
  %5 = sdiv exact i64 %4, %1
  ret i64 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
