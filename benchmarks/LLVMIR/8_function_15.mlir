; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1, i64 %2, i32 %3) {
  %5 = ashr i64 %0, %1
  %6 = urem i64 %5, %1
  %7 = icmp ult i64 %0, %6
  %8 = sdiv i64 %0, %5
  %9 = select i1 %7, i64 %2, i64 %8
  %10 = zext i32 %3 to i64
  %11 = and i64 %9, %10
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
