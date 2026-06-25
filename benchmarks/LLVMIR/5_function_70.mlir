; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i1 %0, i64 %1) {
  %3 = trunc i64 %1 to i32
  %4 = zext i32 %3 to i64
  %5 = lshr exact i64 %1, %4
  %6 = select i1 %0, i64 %5, i64 %1
  %7 = trunc i64 %6 to i1
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
