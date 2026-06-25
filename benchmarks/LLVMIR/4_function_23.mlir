; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i32 %0, i32 %1, i64 %2) {
  %4 = sext i32 %0 to i64
  %5 = zext i32 %1 to i64
  %6 = or disjoint i64 %5, %2
  %7 = urem i64 %4, %6
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
