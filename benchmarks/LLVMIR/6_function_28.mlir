; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i64 %1, i64 %2) {
  %4 = sdiv i64 %1, %2
  %5 = and i64 %4, %1
  %6 = trunc i64 %5 to i32
  %7 = zext i32 %6 to i64
  %8 = ashr exact i64 %0, %7
  %9 = trunc i64 %8 to i1
  ret i1 %9
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
