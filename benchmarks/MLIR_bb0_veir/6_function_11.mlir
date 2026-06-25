"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i1):
    %0 = "llvm.srem"(%arg0, %arg0) : (i64, i64) -> i64
    %1 = "llvm.trunc"(%arg1) <{overflowFlags = 0 : i32}> : (i64) -> i32
    %2 = "llvm.sext"(%1) : (i32) -> i64
    %3 = "llvm.and"(%0, %2) : (i64, i64) -> i64
    %4 = "llvm.select"(%arg2, %0, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.lshr"(%3, %4) : (i64, i64) -> i64
    "func.return"(%5) : (i64) -> ()
  }): () -> ()
}) : () -> ()
