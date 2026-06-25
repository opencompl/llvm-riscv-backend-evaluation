; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i32 %1) {
  %3 = udiv i64 %0, %0
  %4 = ashr i64 %3, %0
  %5 = zext i32 %1 to i64
  %6 = xor i64 %4, %5
  ret i64 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
