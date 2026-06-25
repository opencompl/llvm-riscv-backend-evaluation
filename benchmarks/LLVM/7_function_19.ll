"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.and"(%arg1, %arg2) : (i64, i64) -> i64
    %1 = "llvm.lshr"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.urem"(%1, %arg1) : (i64, i64) -> i64
    %3 = "llvm.xor"(%2, %2) : (i64, i64) -> i64
    %4 = "llvm.xor"(%3, %0) : (i64, i64) -> i64
    %5 = "llvm.urem"(%4, %arg1) : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "llvm.return"(%6) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

