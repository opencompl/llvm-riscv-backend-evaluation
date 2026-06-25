; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = urem i64 %0, %1
  %4 = or disjoint i64 %3, %3
  %5 = and i64 %4, %3
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
