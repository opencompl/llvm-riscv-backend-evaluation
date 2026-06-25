"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i64):
    %0 = "llvm.select"(%arg0, %arg1, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.xor"(%arg1, %arg2) : (i64, i64) -> i64
    %2 = "llvm.ashr"(%arg1, %1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.ashr"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.trunc"(%3) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%4) : (i32) -> ()
  }): () -> ()
}) : () -> ()
