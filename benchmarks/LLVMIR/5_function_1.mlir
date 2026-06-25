; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i32 %0) {
  %2 = zext i32 %0 to i64
  %3 = ashr exact i64 %2, %2
  %4 = zext i32 %0 to i64
  %5 = urem i64 %3, %4
  %6 = trunc i64 %5 to i1
  ret i1 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
