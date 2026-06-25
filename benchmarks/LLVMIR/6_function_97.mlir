; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0) {
  %2 = trunc i64 %0 to i32
  %3 = sext i32 %2 to i64
  %4 = trunc i64 %3 to i1
  %5 = select i1 %4, i64 %3, i64 %3
  %6 = and i64 %3, %5
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
