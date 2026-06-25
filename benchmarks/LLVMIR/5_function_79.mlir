; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = or disjoint i64 %0, %0
  %4 = lshr i64 %3, %0
  %5 = trunc i64 %1 to i32
  %6 = sext i32 %5 to i64
  %7 = icmp ule i64 %4, %6
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
