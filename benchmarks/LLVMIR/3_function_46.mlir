; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = ashr i64 %0, %1
  %5 = sdiv i64 %2, %4
  %6 = icmp eq i64 %4, %5
  ret i1 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
