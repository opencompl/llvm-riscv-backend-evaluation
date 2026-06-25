; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = lshr i64 %0, %1
  %4 = trunc i64 %0 to i32
  %5 = sext i32 %4 to i64
  %6 = lshr i64 %3, %5
  %7 = urem i64 %6, %5
  %8 = icmp ule i64 %6, %7
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
