"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i32):
    %0 = "llvm.sext"(%arg2) : (i32) -> i64
    %1 = "llvm.udiv"(%0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.select"(%arg0, %arg1, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.srem"(%2, %arg1) : (i64, i64) -> i64
    "func.return"(%3) : (i64) -> ()
  }): () -> ()
}) : () -> ()
