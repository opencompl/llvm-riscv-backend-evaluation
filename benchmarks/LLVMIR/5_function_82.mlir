; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i32
  %5 = sext i32 %4 to i64
  %6 = or disjoint i64 %5, %0
  %7 = lshr exact i64 %1, %2
  %8 = icmp uge i64 %6, %7
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
