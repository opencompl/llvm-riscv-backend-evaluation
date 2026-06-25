"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i1):
    %0 = "llvm.srem"(%arg1, %arg1) : (i64, i64) -> i64
    %1 = "llvm.select"(%arg2, %0, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %2 = "llvm.select"(%arg0, %arg1, %1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.srem"(%2, %0) : (i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %5 = "llvm.sext"(%4) : (i32) -> i64
    "func.return"(%5) : (i64) -> ()
  }): () -> ()
}) : () -> ()
