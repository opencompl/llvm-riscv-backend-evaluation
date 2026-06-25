; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0) {
  %2 = udiv i64 %0, %0
  %3 = and i64 %2, %0
  %4 = or i64 %0, %3
  %5 = trunc i64 %0 to i32
  %6 = sext i32 %5 to i64
  %7 = icmp ne i64 %4, %6
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
