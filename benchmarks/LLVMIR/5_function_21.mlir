; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0) {
  %2 = lshr i64 %0, %0
  %3 = trunc i64 %2 to i1
  %4 = select i1 %3, i64 %2, i64 %0
  %5 = trunc i64 %4 to i32
  %6 = zext i32 %5 to i64
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
