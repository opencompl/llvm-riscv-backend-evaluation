"builtin.module"() ({
  "func.func"() <{sym_name = "func0", function_type = () -> i32}> ({
  ^bb0(%arg0: i1, %arg1: i64, %arg2: i64):
    %0 = "llvm.select"(%arg0, %arg1, %arg2) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %1 = "llvm.srem"(%0, %arg1) : (i64, i64) -> i64
    %2 = "llvm.ashr"(%arg2, %arg1) <{isExact}> : (i64, i64) -> i64
    %3 = "llvm.icmp"(%1, %2) <{predicate = 2 : i64}> : (i64, i64) -> i1
    %4 = "llvm.select"(%3, %2, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i64, i64) -> i64
    %5 = "llvm.trunc"(%4) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "func.return"(%5) : (i32) -> ()
  }): () -> ()
}) : () -> ()
