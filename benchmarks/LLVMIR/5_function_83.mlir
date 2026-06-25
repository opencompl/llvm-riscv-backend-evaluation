; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i32 %2) {
  %4 = or i64 %0, %1
  %5 = sext i32 %2 to i64
  %6 = ashr i64 %4, %5
  %7 = sdiv exact i64 %0, %6
  %8 = icmp sge i64 %6, %7
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
