; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i32 %1, i64 %2) {
  %4 = trunc i64 %0 to i1
  %5 = zext i32 %1 to i64
  %6 = select i1 %4, i64 %5, i64 %2
  %7 = zext i32 %1 to i64
  %8 = ashr exact i64 %6, %7
  %9 = trunc i64 %2 to i32
  %10 = zext i32 %9 to i64
  %11 = icmp uge i64 %8, %10
  ret i1 %11
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
