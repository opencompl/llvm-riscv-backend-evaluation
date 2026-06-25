; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0) {
  %2 = ashr exact i64 %0, %0
  %3 = urem i64 %0, %2
  %4 = and i64 %2, %3
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
