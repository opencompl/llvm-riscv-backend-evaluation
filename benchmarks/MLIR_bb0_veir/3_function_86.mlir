"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i1, %arg1: i32, %arg2: i64):
    %0 = "llvm.zext"(%arg1) : (i32) -> i64
    %1 = "llvm.select"(%arg0, %0, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%2) : (i32) -> ()
  }): () -> ()
}) : () -> ()
