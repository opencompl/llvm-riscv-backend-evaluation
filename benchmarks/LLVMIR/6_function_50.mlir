; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i1 %2) {
  %4 = urem i64 %0, %0
  %5 = ashr i64 %4, %1
  %6 = trunc i64 %5 to i32
  %7 = zext i32 %6 to i64
  %8 = select i1 %2, i64 %5, i64 %0
  %9 = urem i64 %7, %8
  ret i64 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
