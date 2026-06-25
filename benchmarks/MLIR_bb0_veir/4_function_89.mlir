"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i1}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.lshr"(%arg1, %arg2) : (i64, i64) -> i64
    %1 = "llvm.xor"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.or"(%1, %arg2) <{isDisjoint}> : (i64, i64) -> i64
    %3 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i1
    "func.return"(%3) : (i1) -> ()
  }): () -> ()
}) : () -> ()
