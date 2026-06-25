"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i64):
    %0 = "llvm.select"(%arg0, %arg1, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.xor"(%0, %arg2) : (i64, i64) -> i64
    %2 = "llvm.srem"(%1, %arg1) : (i64, i64) -> i64
    "func.return"(%2) : (i64) -> ()
  }): () -> ()
}) : () -> ()
