; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i32 %1, i64 %2) {
  %4 = zext i32 %1 to i64
  %5 = and i64 %0, %4
  %6 = lshr i64 %2, %2
  %7 = icmp slt i64 %5, %6
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
