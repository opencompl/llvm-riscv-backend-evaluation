; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define i32 @main(i64 %0) {
  %2 = or disjoint i64 %0, %0
  %3 = lshr exact i64 %0, %2
  %4 = trunc i64 %3 to i32
  %5 = sext i32 %4 to i64
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
