; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2) {
  %4 = or i64 %0, %1
  %5 = icmp slt i64 %4, %0
  %6 = select i1 %5, i64 %2, i64 %0
  %7 = sdiv exact i64 %6, %2
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
