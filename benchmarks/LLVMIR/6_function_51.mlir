; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = srem i64 %0, %0
  %5 = trunc i64 %1 to i32
  %6 = zext i32 %5 to i64
  %7 = urem i64 %6, %2
  %8 = and i64 %4, %7
  %9 = icmp ult i64 %4, %8
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
