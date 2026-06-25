; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1, i64 %2) {
  %4 = trunc i64 %0 to i32
  %5 = zext i32 %4 to i64
  %6 = icmp uge i64 %5, %5
  %7 = select i1 %6, i64 %0, i64 %0
  %8 = or i64 %0, %7
  %9 = ashr exact i64 %2, %2
  %10 = or disjoint i64 %1, %9
  %11 = ashr i64 %8, %10
  ret i64 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
