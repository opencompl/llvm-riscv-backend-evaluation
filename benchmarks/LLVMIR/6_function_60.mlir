; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i1 @main(i64 %0) {
  %2 = sdiv exact i64 %0, %0
  %3 = trunc i64 %0 to i32
  %4 = sext i32 %3 to i64
  %5 = sdiv exact i64 %2, %4
  %6 = lshr exact i64 %0, %5
  %7 = trunc i64 %6 to i1
  ret i1 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
