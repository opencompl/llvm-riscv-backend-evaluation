; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i1 %1, i64 %2, i32 %3) {
  %5 = xor i64 %2, %2
  %6 = zext i32 %3 to i64
  %7 = select i1 %1, i64 %5, i64 %6
  %8 = ashr exact i64 %0, %7
  ret i64 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
