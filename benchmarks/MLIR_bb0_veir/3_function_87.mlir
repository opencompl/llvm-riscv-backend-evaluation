"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.icmp"(%arg0, %arg1) <{predicate = 8 : i64}> : (i64, i64) -> i1
    %1 = "llvm.select"(%0, %arg0, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%2) : (i32) -> ()
  }): () -> ()
}) : () -> ()
