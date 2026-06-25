; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i1 %1, i64 %2) {
  %4 = select i1 %1, i64 %0, i64 %2
  %5 = udiv i64 %0, %4
  %6 = urem i64 %2, %2
  %7 = srem i64 %5, %6
  %8 = trunc i64 %7 to i32
  %9 = zext i32 %8 to i64
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
