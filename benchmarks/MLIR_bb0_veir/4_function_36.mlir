"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.or"(%arg0, %arg1) <{isDisjoint}> : (i64, i64) -> i64
    %1 = "llvm.urem"(%arg2, %arg2) : (i64, i64) -> i64
    %2 = "llvm.xor"(%1, %arg0) : (i64, i64) -> i64
    %3 = "llvm.urem"(%0, %2) : (i64, i64) -> i64
    "func.return"(%3) : (i64) -> ()
  }): () -> ()
}) : () -> ()
