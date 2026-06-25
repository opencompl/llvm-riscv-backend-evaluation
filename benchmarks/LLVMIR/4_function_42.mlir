; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i1 %1, i64 %2) {
  %4 = zext i32 %0 to i64
  %5 = srem i64 %4, %2
  %6 = select i1 %1, i64 %5, i64 %5
  %7 = and i64 %4, %6
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
