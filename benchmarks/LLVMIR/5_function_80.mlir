; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i64 @main(i64 %0, i64 %1) {
  %3 = sdiv exact i64 %0, %1
  %4 = ashr exact i64 %0, %3
  %5 = ashr exact i64 %0, %4
  %6 = trunc i64 %5 to i32
  %7 = zext i32 %6 to i64
  ret i64 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
