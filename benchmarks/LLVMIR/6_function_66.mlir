; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i1 %1, i64 %2) {
  %4 = select i1 %1, i64 %0, i64 %2
  %5 = sdiv i64 %0, %4
  %6 = trunc i64 %2 to i32
  %7 = zext i32 %6 to i64
  %8 = sdiv exact i64 %5, %7
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
