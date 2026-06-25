; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = trunc i64 %0 to i32
  %4 = sext i32 %3 to i64
  %5 = urem i64 %4, %0
  %6 = trunc i64 %1 to i32
  %7 = zext i32 %6 to i64
  %8 = or disjoint i64 %5, %7
  ret i64 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
