; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0, i32 %1) {
  %3 = or i64 %0, %0
  %4 = zext i32 %1 to i64
  %5 = udiv i64 %3, %4
  %6 = ashr exact i64 %3, %5
  %7 = trunc i64 %6 to i1
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
