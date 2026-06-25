"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64):
    %0 = "llvm.or"(%arg0, %arg0) <{isDisjoint}> : (i64, i64) -> i64
    %1 = "llvm.select"(%arg1, %arg2, %0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.lshr"(%1, %arg0) : (i64, i64) -> i64
    %3 = "llvm.srem"(%arg0, %2) : (i64, i64) -> i64
    %4 = "llvm.and"(%3, %1) : (i64, i64) -> i64
    %5 = "llvm.xor"(%arg0, %4) : (i64, i64) -> i64
    %6 = "llvm.trunc"(%5) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%6) : (i32) -> ()
  }): () -> ()
}) : () -> ()
