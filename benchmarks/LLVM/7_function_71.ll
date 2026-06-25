"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.urem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.srem"(%arg1, %arg2) : (i64, i64) -> i64
    %2 = "llvm.udiv"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.or"(%2, %arg2) : (i64, i64) -> i64
    %4 = "llvm.xor"(%0, %3) : (i64, i64) -> i64
    %5 = "llvm.xor"(%arg2, %arg1) : (i64, i64) -> i64
    %6 = "llvm.srem"(%4, %5) : (i64, i64) -> i64
    "llvm.return"(%6) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

