"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.trunc"(%arg0) <{overflowFlags = 0 : i32}> : (i64) -> i1
    %1 = "llvm.or"(%arg1, %arg0) : (i64, i64) -> i64
    %2 = "llvm.select"(%0, %arg0, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    "func.return"(%2) : (i64) -> ()
  }): () -> ()
}) : () -> ()
