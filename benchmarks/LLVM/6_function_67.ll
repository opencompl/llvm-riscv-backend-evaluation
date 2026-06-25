"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "main", visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.xor"(%arg1, %arg1) : (i64, i64) -> i64
    %1 = "llvm.lshr"(%arg1, %0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.and"(%arg0, %1) : (i64, i64) -> i64
    %3 = "llvm.xor"(%arg2, %2) : (i64, i64) -> i64
    %4 = "llvm.srem"(%arg1, %3) : (i64, i64) -> i64
    %5 = "llvm.ashr"(%arg0, %4) : (i64, i64) -> i64
    "llvm.return"(%5) : (i64) -> ()
  }) : () -> ()
}) : () -> ()

