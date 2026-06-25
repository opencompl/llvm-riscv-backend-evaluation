; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i1 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %1 to i32
  %5 = zext i32 %4 to i64
  %6 = ashr exact i64 %5, %2
  %7 = select i1 %0, i64 %6, i64 %1
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
