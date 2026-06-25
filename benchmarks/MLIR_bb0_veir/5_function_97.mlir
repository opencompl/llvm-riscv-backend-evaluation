"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %1 = "llvm.sext"(%0) : (i32) -> i64
    %2 = "llvm.sext"(%0) : (i32) -> i64
    %3 = "llvm.or"(%1, %2) <{isDisjoint}> : (i64, i64) -> i64
    %4 = "llvm.srem"(%3, %arg1) : (i64, i64) -> i64
    "func.return"(%4) : (i64) -> ()
  }): () -> ()
}) : () -> ()
