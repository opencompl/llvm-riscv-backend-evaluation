"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i32, %arg1: i1, %arg2: i64):
    %0 = "llvm.zext"(%arg0) : (i32) -> i64
    %1 = "llvm.srem"(%0, %arg2) : (i64, i64) -> i64
    %2 = "llvm.select"(%arg1, %1, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.and"(%0, %2) : (i64, i64) -> i64
    "func.return"(%3) : (i64) -> ()
  }): () -> ()
}) : () -> ()
