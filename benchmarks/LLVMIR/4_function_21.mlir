; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = sdiv exact i64 %1, %1
  %5 = udiv i64 %2, %4
  %6 = ashr exact i64 %1, %5
  %7 = icmp sgt i64 %0, %6
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
