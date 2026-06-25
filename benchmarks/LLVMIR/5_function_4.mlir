; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i32 %1, i64 %2) {
  %4 = sext i32 %1 to i64
  %5 = sdiv i64 %0, %4
  %6 = udiv i64 %0, %5
  %7 = or disjoint i64 %6, %2
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
