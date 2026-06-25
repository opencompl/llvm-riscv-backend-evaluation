; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i1 %1, i64 %2) {
  %4 = srem i64 %0, %0
  %5 = and i64 %4, %2
  %6 = select i1 %1, i64 %4, i64 %5
  %7 = sdiv i64 %4, %6
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
