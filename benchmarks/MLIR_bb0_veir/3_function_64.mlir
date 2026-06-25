"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.udiv"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.ashr"(%0, %arg1) <{isExact}> : (i64, i64) -> i64
    %2 = "llvm.lshr"(%0, %1) <{isExact}> : (i64, i64) -> i64
    "func.return"(%2) : (i64) -> ()
  }): () -> ()
}) : () -> ()
