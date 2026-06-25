; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0) {
  %2 = trunc i64 %0 to i32
  %3 = zext i32 %2 to i64
  %4 = srem i64 %0, %0
  %5 = and i64 %3, %4
  %6 = udiv i64 %5, %3
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
