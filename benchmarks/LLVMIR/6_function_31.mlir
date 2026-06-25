; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1) {
  %3 = trunc i64 %1 to i32
  %4 = sext i32 %3 to i64
  %5 = zext i32 %3 to i64
  %6 = sdiv exact i64 %4, %5
  %7 = ashr exact i64 %6, %5
  %8 = icmp ule i64 %0, %7
  ret i1 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
