; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i1 %1, i64 %2) {
  %4 = ashr i64 %0, %0
  %5 = select i1 %1, i64 %2, i64 %2
  %6 = ashr i64 %4, %5
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
