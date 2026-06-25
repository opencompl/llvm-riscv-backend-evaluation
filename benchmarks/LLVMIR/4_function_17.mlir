; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1, i32 %2) {
  %4 = sext i32 %2 to i64
  %5 = udiv i64 %4, %1
  %6 = select i1 %0, i64 %1, i64 %5
  %7 = srem i64 %6, %1
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
