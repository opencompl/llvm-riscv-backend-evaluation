; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = sdiv exact i64 %0, %0
  %4 = urem i64 %0, %1
  %5 = srem i64 %3, %4
  %6 = trunc i64 %5 to i32
  %7 = zext i32 %6 to i64
  %8 = trunc i64 %7 to i1
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
