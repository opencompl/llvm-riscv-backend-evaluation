; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = urem i64 %0, %1
  %5 = trunc i64 %2 to i32
  %6 = sext i32 %5 to i64
  %7 = and i64 %4, %6
  %8 = icmp ule i64 %7, %4
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
