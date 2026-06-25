; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i1 %0, i64 %1) {
  %3 = select i1 %0, i64 %1, i64 %1
  %4 = lshr i64 %1, %3
  %5 = sdiv exact i64 %4, %1
  %6 = and i64 %3, %5
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
