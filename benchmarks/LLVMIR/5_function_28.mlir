; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i1 %0, i64 %1, i64 %2) {
  %4 = udiv i64 %1, %1
  %5 = sdiv i64 %4, %4
  %6 = srem i64 %5, %2
  %7 = select i1 %0, i64 %5, i64 %6
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
