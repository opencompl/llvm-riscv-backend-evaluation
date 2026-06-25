; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i32 %0) {
  %2 = sext i32 %0 to i64
  %3 = trunc i64 %2 to i1
  %4 = select i1 %3, i64 %2, i64 %2
  %5 = trunc i64 %4 to i32
  %6 = zext i32 %5 to i64
  %7 = icmp uge i64 %2, %6
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
