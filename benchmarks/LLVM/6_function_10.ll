"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.xor"(%arg1, %arg2) : (i64, i64) -> i64
    %1 = "llvm.sdiv"(%arg1, %arg2) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.sdiv"(%arg1, %1) : (i64, i64) -> i64
    %3 = "llvm.udiv"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.lshr"(%arg0, %3) : (i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%5) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

