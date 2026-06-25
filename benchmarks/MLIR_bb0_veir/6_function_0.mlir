"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i64}> ({
  ^bb0(%arg0: i64, %arg1: i1, %arg2: i64):
    %0 = "llvm.select"(%arg1, %arg0, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.srem"(%arg0, %0) : (i64, i64) -> i64
    %2 = "llvm.select"(%arg1, %arg2, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %3 = "llvm.sdiv"(%1, %2) : (i64, i64) -> i64
    %4 = "llvm.urem"(%3, %1) : (i64, i64) -> i64
    %5 = "llvm.or"(%4, %1) : (i64, i64) -> i64
    "func.return"(%5) : (i64) -> ()
  }): () -> ()
}) : () -> ()
