; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0) {
  %2 = trunc i64 %0 to i32
  %3 = sext i32 %2 to i64
  %4 = and i64 %0, %0
  %5 = icmp ule i64 %3, %4
  ret i1 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
