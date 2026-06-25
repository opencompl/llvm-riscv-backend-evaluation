; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0, i64 %1) {
  %3 = sdiv i64 %0, %0
  %4 = and i64 %1, %1
  %5 = ashr exact i64 %3, %4
  %6 = urem i64 %0, %5
  %7 = and i64 %6, %1
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
