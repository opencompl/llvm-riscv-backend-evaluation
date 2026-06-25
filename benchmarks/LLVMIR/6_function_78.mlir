; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or i64 %0, %0
  %5 = and i64 %4, %0
  %6 = trunc i64 %1 to i32
  %7 = zext i32 %6 to i64
  %8 = udiv i64 %7, %2
  %9 = icmp ne i64 %5, %8
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
