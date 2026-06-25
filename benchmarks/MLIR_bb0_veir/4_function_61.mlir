"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.or"(%arg0, %arg1) : (i64, i64) -> i64
    %1 = "llvm.sdiv"(%0, %arg0) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.or"(%1, %1) : (i64, i64) -> i64
    %3 = "llvm.or"(%2, %arg0) <{isDisjoint}> : (i64, i64) -> i64
    "func.return"(%3) : (i64) -> ()
  }): () -> ()
}) : () -> ()
