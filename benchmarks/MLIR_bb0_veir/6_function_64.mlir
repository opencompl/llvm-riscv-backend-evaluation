"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.or"(%arg0, %arg1) <{isDisjoint}> : (i64, i64) -> i64
    %1 = "llvm.udiv"(%arg0, %arg0) : (i64, i64) -> i64
    %2 = "llvm.srem"(%1, %arg0) : (i64, i64) -> i64
    %3 = "llvm.ashr"(%arg2, %arg2) <{isExact}> : (i64, i64) -> i64
    %4 = "llvm.srem"(%2, %3) : (i64, i64) -> i64
    %5 = "llvm.lshr"(%0, %4) : (i64, i64) -> i64
    "func.return"(%5) : (i64) -> ()
  }): () -> ()
}) : () -> ()
