; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i32 %2) {
  %4 = sdiv exact i64 %0, %1
  %5 = zext i32 %2 to i64
  %6 = lshr i64 %5, %4
  %7 = sdiv i64 %6, %5
  %8 = icmp slt i64 %4, %7
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
